require "rspec/mocks"
require "rspec/contracts/message"
require "rspec/contracts/message_return"

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
      def initialize(interface, object, method_name, proxy)
        @message = Message.new method_name
        interface.add_message @message
        super(object, method_name, proxy)
      end

      def add_simple_stub(method_name, return_value)
        @message.specifications[:return_value] = MessageReturn.new(return_value)
        super
      end
    end
  end
end
