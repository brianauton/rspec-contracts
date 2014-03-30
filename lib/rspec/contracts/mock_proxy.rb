require "rspec/mocks"
require "rspec/contracts/message_group"
require "rspec/contracts/returned_response"
require "rspec/contracts/yielded_response"

module RSpec
  module Contracts
    class MockProxy < Mocks::Proxy
      def initialize(object, order_group, interface)
        super(object, order_group)
        @method_doubles = Hash.new do |h, k|
          h[k] = ContractMethodDouble.new(interface, object, k, self)
        end
      end
    end

    class ContractMethodDouble < Mocks::MethodDouble
      attr_reader :message

      def initialize(interface, object, method_name, proxy)
        @message_group = MessageGroup.new(interface, method_name)
        super(object, method_name, proxy)
      end

      def set_arguments(arguments)
        @message_group.set_arguments arguments
      end

      def add_response(response)
        @message_group.add_response response
      end

      def add_simple_stub(method_name, return_value)
        add_response ReturnedResponse.new(return_value)
        super
      end

      def message_expectation_class
        ContractMessageExpectation
      end
    end

    class ContractMessageExpectation < Mocks::MessageExpectation
      def with(*args)
        @method_double.set_arguments args
        super
      end

      def and_return(*args)
        args.each { |value| @method_double.add_response ReturnedResponse.new(value) }
        super
      end

      def and_yield(*args)
        args.each { |value| @method_double.add_response YieldedResponse.new(value) }
        super
      end
    end
  end
end
