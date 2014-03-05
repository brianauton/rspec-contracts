module RSpec
  module Contracts
    class Fulfillment
      def initialize(requirement_group, implementation_group)
        @requirement_group = requirement_group
        @implementation_group = implementation_group
      end

      def complete?
        unfulfilled_requirements.empty?
      end

      def unfulfilled_requirements
        @requirement_group.requirements.reject { |requirement| fulfilled? requirement }
      end

      def fulfilled?(requirement)
        @implementation_group.implementations.any? do |implementation|
          requirement.implemented_by? implementation
        end
      end

      def requirements_count
        @requirement_group.requirements.count
      end
    end
  end
end
