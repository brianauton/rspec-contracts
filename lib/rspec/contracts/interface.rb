require "rspec/contracts/message"

module RSpec
  module Contracts
    class Interface
      attr_reader :name, :requirements, :implementations

      def initialize(name)
        @name = name
        @requirements = []
        @implementations = []
      end

      def add_requirement(method_name, options = {})
        @requirements << Message.new(name, method_name, options)
      end

      def add_implementation(method_name, options = {})
        @implementations << Message.new(name, method_name, options)
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
