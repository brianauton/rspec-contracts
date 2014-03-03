module RSpec
  module Contracts
    class Requirement
      def self.create(contract_name, method_name, options = {})
        arg_string = options[:arguments] ? "()" : ""
        return_string = options[:return_value] ? "and return #{options[:return_value].inspect}" : ""
        puts "Interface '#{contract_name}' must respond to '#{method_name}#{arg_string}' #{return_string}"
      end
    end
  end
end
