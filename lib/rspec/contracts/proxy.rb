require "rspec/mocks"
require "rspec/contracts/requirement"

module RSpec
  module Contracts
    class Proxy < Mocks::Proxy
      def initialize(object, order_group, interface_name)
        @interface_name = interface_name
        super(object, order_group)
      end

      def add_stub(location, method_name, opts={}, &implementation)
        create_requirement method_name
        super
      end

      def add_simple_stub(method_name, *args)
        create_requirement method_name, :return_value => args.first
        super
      end

      def add_message_expectation(location, method_name, opts={}, &block)
        create_requirement method_name
        super
      end

      def create_requirement(method_name, options = {})
        Requirement.create @interface_name, method_name, options
      end
    end
  end
end
