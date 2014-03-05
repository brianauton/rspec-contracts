require "rspec/contracts/implementation_group"

module RSpec
  module Contracts
    class Implementation
      attr_reader :interface_name, :method_name, :arguments

      def initialize(interface_name, method_name, options = {})
        @interface_name = interface_name
        @method_name = method_name
        @arguments = options[:arguments]
      end

      def self.group
        @group ||= ImplementationGroup.new
      end

      def self.create(*args)
        group.add new(*args)
      end

      def matches?(requirement)
        [:interface_name, :method_name, :arguments].select do |attribute|
          requirement.send(attribute) != send(attribute)
        end.empty?
      end
    end
  end
end
