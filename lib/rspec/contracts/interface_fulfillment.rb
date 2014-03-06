module RSpec
  module Contracts
    class InterfaceFulfillment
      def initialize(interface)
        @interface = interface
      end

      def complete?
        unfulfilled_requirements.empty?
      end

      def unfulfilled_requirements
        @interface.requirements.reject { |r| fulfilled? r, @interface.implementations }
      end

      def requirements_count
        @interface.requirements.count
      end

      private

      def fulfilled?(requirement, implementations)
        implementations.any? { |i| requirement.fully_described_by? i }
      end
    end
  end
end
