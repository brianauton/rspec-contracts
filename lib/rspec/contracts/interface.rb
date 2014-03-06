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
        Interface.requirements.add Interaction.new(name, method_name, options)
      end

      def add_implementation(method_name, options = {})
        Interface.implementations.add Interaction.new(name, method_name, options)
      end

      def self.implementations
        @implementations ||= InteractionGroup.new
      end

      def self.requirements
        @requrements ||= InteractionGroup.new
      end
    end
  end
end
