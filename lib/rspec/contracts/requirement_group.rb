module RSpec
  module Contracts
    class RequirementGroup
      attr_accessor :requirements

      def initialize
        @requirements = []
      end

      def exists?(requirement)
        @requirements.any?{|r| r.matches? requirement}
      end

      def add(requirement)
        requirements << requirement unless exists? requirement
      end
    end
  end
end
