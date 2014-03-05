module RSpec
  module Contracts
    class RequirementGroup
      attr_accessor :requirements

      def initialize
        @requirements = []
      end

      def exists?(interaction)
        @requirements.any?{|r| r.matches? interaction}
      end

      def add(interaction)
        requirements << interaction unless exists? interaction
      end
    end
  end
end
