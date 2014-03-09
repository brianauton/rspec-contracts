require "rspec/contracts/implementor"
require "rspec/contracts/interface_group"

module RSpec
  module Contracts
    class Interface
      attr_reader :name, :requirements

      def initialize(name)
        @name = name
        @requirements = []
      end

      def add_requirement(message)
        @requirements << message
      end

      def implementors
        Implementor.all.select{ |i| i.interface_names.include? name }
      end

      def implementations
        implementors.map(&:messages).flatten
      end

      def self.all
        @all ||= InterfaceGroup.new
      end

      def self.find_or_create(name)
        all.find_or_create name
      end

      def unique_requirements
        requirements.uniq(&:to_hash)
      end
    end
  end
end
