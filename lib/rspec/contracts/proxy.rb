require "rspec/mocks/proxy"
require "rspec/contracts/requirement"

module RSpec
  module Contracts
    class Proxy < Mocks::Proxy
      def initialize(object, order_group, contract_name)
        @contract_name = contract_name
        super(object, order_group)
      end

      def add_stub(location, method_name, opts={}, &implementation)
        create_requirement method_name, opts
        super
      end

      def add_simple_stub(method_name, *args)
        create_requirement method_name, [], args.first
        super
      end

      def add_message_expectation(location, method_name, opts={}, &block)
        create_requirement method_name, opts, nil
        super
      end

      def create_requirement(method_name, arguments, return_value)
        Requirement.create @contract_name, method_name, arguments, return_value
      end
    end
  end
end
