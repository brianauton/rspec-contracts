module RSpec
  module Contracts
    class Requirement
      def self.create(contract_name, method_name, args, return_value)
        arg_string = args.any? ? "()" : ""
        return_string = return_value ? "and return #{return_value.inspect}" : ""
        puts "Interface '#{contract_name}' must respond to '#{method_name}#{arg_string}' #{return_string}"
      end
    end
  end
end
