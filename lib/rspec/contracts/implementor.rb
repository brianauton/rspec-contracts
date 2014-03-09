module RSpec
  module Contracts
    class Implementor
      attr_reader :subject, :interface_names, :messages

      def initialize(subject)
        @implementor = subject
        @interface_names = []
        @messages = []
      end

      def add_message(message)
        messages << message
      end

      def self.collection
        @collection ||= {}
      end

      def self.all
        collection.values
      end

      def self.find_or_create(subject)
        collection[subject] ||= new(subject)
      end
    end
  end
end
