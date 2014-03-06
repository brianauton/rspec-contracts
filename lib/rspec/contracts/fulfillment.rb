module RSpec
  module Contracts
    class Fulfillment
      def initialize(requirement_group, implementation_group, interfaces)
        @requirement_group = requirement_group
        @implementation_group = implementation_group
        @interfaces = interfaces
      end

      def complete?
        incomplete_interfaces.empty?
      end

      def incomplete_interfaces
        @interfaces.reject { |i| complete_interface? i }
      end

      def complete_interface?(interface)
        interface.requirements.all? { |r| fulfilled? r, interface.implementations }
      end

      def unfulfilled_requirements
        @requirement_group.interactions.reject { |requirement| fulfilled? requirement, @implementation_group.interactions }
      end

      def fulfilled?(requirement, implementations)
        result = implementations.any? { |i| requirement.fully_described_by? i }
        result
      end

      def requirements_count
        @requirement_group.interactions.count
      end
    end
  end
end
