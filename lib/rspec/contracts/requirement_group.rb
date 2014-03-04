module RSpec
  module Contracts
    class RequirementGroup
      attr_accessor :requirements

      def initialize
        @requirements = []
      end

      def add(requirement)
        requirements << requirement
      end
    end
  end
end
