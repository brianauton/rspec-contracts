module RSpec
  module Contracts
    class ReturnedResponse
      attr_reader :value

      def initialize(value)
        @value = value
      end

      def described_by?(other)
        other && (value == other.value)
      end

      def to_hash
        {:value => value}
      end
    end
  end
end
