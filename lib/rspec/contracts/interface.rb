require "rspec/contracts/implementation_group"
require "rspec/contracts/requirement_group"

module RSpec
  module Contracts
    class Interface
      def self.implementations
        @implementations ||= ImplementationGroup.new
      end

      def self.add_implementation(implementation)
        implementations.add implementation
      end

      def self.requirements
        @requrements ||= RequirementGroup.new
      end

      def self.add_requirement(requirement)
        requirements.add requirement
      end
    end
  end
end
