module RSpec
  module Contracts
    class RequirementView
      def initialize(requirement)
        @requirement = requirement
      end

      def render
        arg_string = @requirement.specifications[:arguments] ? "()" : ""
        return_string = @requirement.return_value ? "and return #{@requirement.return_value.inspect}" : ""
        "Interface '#{@requirement.interface_name}' must respond to '#{@requirement.method_name}#{arg_string}' #{return_string}"
      end
    end
  end
end
