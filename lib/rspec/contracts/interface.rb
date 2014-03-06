require "rspec/contracts/interaction"
require "rspec/contracts/interaction_group"

module RSpec
  module Contracts
    class Interface
      attr_reader :name

      def initialize(name)
        @name = name
      end

      def add_requirement(method_name, options = {})
        Interface.add_requirement Interaction.new(name, method_name, options)
      end

      def add_implementation(method_name, options = {})
        Interface.add_implementation Interaction.new(name, method_name, options)
      end

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
