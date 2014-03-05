require "rspec/contracts/interaction_group"

module RSpec
  module Contracts
    class Interface
      def self.implementations
        @implementations ||= InteractionGroup.new
      end

      def self.add_implementation(interaction)
        implementations.add interaction
      end

      def self.requirements
        @requrements ||= InteractionGroup.new
      end

      def self.add_requirement(interaction)
        requirements.add interaction
      end
    end
  end
end
