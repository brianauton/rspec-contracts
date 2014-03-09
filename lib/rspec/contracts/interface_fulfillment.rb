module RSpec
  module Contracts
    class InterfaceFulfillment
      attr_reader :interface

      def initialize(interface, implementors)
        @interface = interface
        @implementors = implementors
      end

      def complete?
        unfulfilled_requirements.empty?
      end

      def unfulfilled_requirements
        interface.unique_requirements.reject{ |r| fulfilled_by_all? r }
      end

      def requirements_count
        interface.unique_requirements.count
      end

      private

      def fulfilled_by_all?(requirement)
        @implementors.all?{ |i| fulfilled_by? requirement, i }
      end

      def fulfilled_by?(requirement, implementor)
        implementor.messages.any? { |message| requirement.fully_described_by? message }
      end
    end
  end
end
