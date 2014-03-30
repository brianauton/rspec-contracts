module RSpec
  module Contracts
    class YieldedResponse
      attr_reader :yielded_value

      def initialize(value)
        @yielded_value = value
      end

      def described_by?(response)
        response.respond_to?(:yielded_value) && (yielded_value == response.yielded_value)
      end

      def to_hash
        {:yielded_value => yielded_value}
      end
    end
  end
end
