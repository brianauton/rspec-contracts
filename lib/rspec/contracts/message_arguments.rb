module RSpec
  module Contracts
    class MessageArguments
      attr_reader :arguments

      def initialize(arguments)
        @arguments = arguments
      end

      def fully_described_by?(other)
        other && (arguments == other.arguments)
      end
    end
  end
end
