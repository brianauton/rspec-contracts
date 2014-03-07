module RSpec
  module Contracts
    class Interface
      attr_reader :name, :requirements, :implementations

      def initialize(name)
        @name = name
        @requirements = []
        @implementations = []
      end

      def add_requirement(message)
        @requirements << message
      end

      def add_implementation(message)
        @implementations << message
      end

      def self.all
        @all ||= {}
      end

      def self.find_or_create(name)
        all[name] ||= new(name)
      end

      def unique_requirements
        requirements.uniq(&:to_hash)
      end
    end
  end
end
