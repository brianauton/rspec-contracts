require "rspec/contracts/interaction"
require "rspec/contracts/interaction_group"

module RSpec
  module Contracts
    class Interface
      attr_reader :name, :requirements, :implementations

      def initialize(name)
        @name = name
        @requirements = InteractionGroup.new
        @implementations = InteractionGroup.new
      end

      def add_requirement(method_name, options = {})
        @requirements.add Interaction.new(name, method_name, options)
      end

      def add_implementation(method_name, options = {})
        @implementations.add Interaction.new(name, method_name, options)
      end

      def self.all
        @all ||= {}
      end

      def self.find_or_create(name)
        all[name] ||= new(name)
      end
    end
  end
end
