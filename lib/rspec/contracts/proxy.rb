require "rspec/mocks/proxy"

module RSpec
  module Contracts
    class Proxy < Mocks::Proxy
      def initialize(object, order_group, contract_name)
        @contract_name = contract_name
        super(object, order_group)
      end

      def add_stub(location, method_name, opts={}, &implementation)
        contract_message method_name, opts
        super
      end

      def add_simple_stub(method_name, *args)
        contract_message method_name, [], args.first
        super
      end

      def add_message_expectation(location, method_name, opts={}, &block)
        contract_message method_name, opts, nil
        super
      end

      def contract_message(method_name, args, return_value)
        arg_string = args.any? ? "()" : ""
        return_string = return_value ? "and return #{return_value.inspect}" : ""
        puts "Interface '#{@contract_name}' must respond to '#{method_name}#{arg_string}' #{return_string}"
      end
    end
  end
end
