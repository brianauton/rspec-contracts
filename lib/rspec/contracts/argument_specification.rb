module RSpec
  module Contracts
    class ArgumentSpecification
      def initialize(arguments)
      end

      def fully_described_by(specification)
        arguments == specification.arguments
      end
    end
  end
end
