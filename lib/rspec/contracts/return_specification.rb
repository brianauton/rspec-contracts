module RSpec
  module Contracts
    class ReturnSpecification
      attr_reader :value

      def initialize(value)
        @value = value
      end

      def fully_described_by?(specification)
        specification && (value == specification.value)
      end
    end
  end
end
