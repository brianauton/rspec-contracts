require "rspec/mocks"
require "rspec/contracts/message"
require "rspec/contracts/message_return"

module RSpec
  module Contracts
    class MockProxy < Mocks::Proxy
      def initialize(object, order_group, interface)
        @interface = interface
        super(object, order_group)
      end

      def add_stub(location, method_name, opts={}, &implementation)
        add_message method_name
        super
      end

      def add_simple_stub(method_name, *args)
        add_message method_name, :return_value => MessageReturn.new(args.first)
        super
      end

      def add_message_expectation(location, method_name, opts={}, &block)
        add_message method_name
        super
      end

      def add_message(method_name, options = {})
        @interface.add_message Message.new(method_name, options)
      end
    end
  end
end
