module RSpec
  module Contracts
    class InterfaceFulfillment
      attr_reader :interface

      def initialize(interface, implementors)
        @interface = interface
        @implementors = implementors
      end

      def complete?
        unfulfilled_messages.empty?
      end

      def unfulfilled_messages
        interface.unique_messages.reject{ |r| fulfilled? r }
      end

      def messages_count
        interface.unique_messages.count
      end

      private

      def fulfilled?(message)
        fulfilled_by_any?(message) && fulfilled_by_all?(message.without_response)
      end

      def fulfilled_by_all?(message)
        @implementors.all?{ |i| fulfilled_by? message, i }
      end

      def fulfilled_by_any?(message)
        @implementors.any?{ |i| fulfilled_by? message, i }
      end

      def fulfilled_by?(message, implementor)
        implementor.messages.any? { |m| message.described_by? m }
      end
    end
  end
end
