require "rspec/mocks"
require "rspec/contracts/interaction"
require "rspec/contracts/interface"
require "rspec/contracts/return_specification"

module RSpec
  module Contracts
    class MockProxy < Mocks::Proxy
      def initialize(object, order_group, interface)
        @interface = interface
        super(object, order_group)
      end

      def add_stub(location, method_name, opts={}, &implementation)
        create_requirement method_name
        super
      end

      def add_simple_stub(method_name, *args)
        create_requirement method_name, :return_value => ReturnSpecification.new(args.first)
        super
      end

      def add_message_expectation(location, method_name, opts={}, &block)
        create_requirement method_name
        super
      end

      def create_requirement(method_name, options = {})
        requirement = Interaction.new @interface.name, method_name, options
        Interface.add_requirement requirement
      end
    end
  end
end
