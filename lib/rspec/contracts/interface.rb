require "rspec/contracts/implementor"
require "rspec/contracts/interface_group"

module RSpec
  module Contracts
    class Interface
      attr_reader :name, :messages

      def initialize(name)
        @name = name
        @messages = []
      end

      def add_message(message)
        @messages << message
      end

      def self.all
        @all ||= InterfaceGroup.new
      end

      def self.find_or_create(name)
        all.find_or_create name
      end

      def unique_messages
        messages.uniq(&:to_hash)
      end
    end
  end
end
