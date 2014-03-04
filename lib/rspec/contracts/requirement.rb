require "rspec/contracts/requirement_group"
require "rspec/contracts/requirement_view"

module RSpec
  module Contracts
    class Requirement
      attr_reader :interface_name, :method_name, :arguments, :return_value

      def initialize(interface_name, method_name, options = {})
        @interface_name = interface_name
        @method_name = method_name
        @arguments = options[:arguments]
        @return_value = options[:return_value]
      end

      def self.group
        @group ||= RequirementGroup.new
      end

      def self.create(*args)
        group.add new(*args)
      end

      def matches?(requirement)
        [:interface_name, :method_name, :arguments, :return_value].select do |attribute|
          requirement.send(attribute) != send(attribute)
        end.empty?
      end
    end
  end
end
