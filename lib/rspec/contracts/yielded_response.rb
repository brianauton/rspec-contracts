module RSpec
  module Contracts
    class YieldedResponse
      attr_reader :yielded_values

      def initialize(*values)
        @yielded_values = values
      end

      def described_by?(response)
        response.respond_to?(:yielded_values) && (yielded_values == response.yielded_values)
      end

      def to_hash
        {:yielded_values => yielded_values}
      end
    end
  end
end
