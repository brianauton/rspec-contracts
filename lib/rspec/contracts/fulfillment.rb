module RSpec
  module Contracts
    class Fulfillment
      def initialize(interfaces)
        @interfaces = interfaces
      end

      def complete?
        incomplete_interfaces.empty?
      end

      def incomplete_interfaces
        @interfaces.reject { |i| complete_interface? i }
      end

      def complete_interface?(interface)
        unfulfilled_requirements_for(interface).empty?
      end

      def unfulfilled_requirements_for(interface)
        interface.requirements.reject { |r| fulfilled? r, interface.implementations }
      end

      def unfulfilled_requirements
        @interfaces.map{ |i| unfulfilled_requirements_for i }.flatten
      end

      def fulfilled?(requirement, implementations)
        result = implementations.any? { |i| requirement.fully_described_by? i }
        result
      end

      def requirements_count
        @interfaces.map{ |i| i.requirements.count }.inject(&:+)
      end
    end
  end
end
