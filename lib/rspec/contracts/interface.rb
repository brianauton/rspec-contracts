require "rspec/contracts/interaction"
require "rspec/contracts/interaction_group"

module RSpec
  module Contracts
    class Interface
      attr_reader :name

      def initialize(name)
        @name = name
      end

      def requirements
        Interface.requirements.select { |i| i.interface_name == name }
      end

      def implementations
        Interface.implementations.select { |i| i.interface_name == name }
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

      def self.all
        @all ||= {}
      end

      def self.find_or_create(name)
        all[name] ||= new(name)
      end
    end
  end
end
