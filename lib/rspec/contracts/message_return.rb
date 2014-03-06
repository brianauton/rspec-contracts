module RSpec
  module Contracts
    class MessageReturn
      attr_reader :value

      def initialize(value)
        @value = value
      end

      def fully_described_by?(other)
        other && (value == other.value)
      end
    end
  end
end
