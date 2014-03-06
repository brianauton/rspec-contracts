module RSpec
  module Contracts
    class ArgumentSpecification
      attr_reader :arguments

      def initialize(arguments)
        @arguments = arguments
      end

      def fully_described_by?(specification)
        specification && (arguments == specification.arguments)
      end
    end
  end
end
