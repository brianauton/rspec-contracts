module RSpec
  module Contracts
    class ReturnedResponse
      attr_reader :returned_value

      def initialize(value)
        @returned_value = value
      end

      def described_by?(response)
        response.respond_to?(:returned_value) && (returned_value == response.returned_value)
      end

      def to_hash
        {:returned_value => returned_value}
      end
    end
  end
end
