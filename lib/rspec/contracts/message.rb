module RSpec
  module Contracts
    class Message
      attr_reader :name
      attr_accessor :arguments, :response

      def initialize(name)
        @name = name
      end

      def described_by?(message)
        [:name, :arguments, :response].all? { |n| send "#{n}_described_by?", message }
      end

      def name_described_by?(message)
        message.name == name
      end

      def arguments_described_by?(message)
        arguments.nil? || arguments == message.arguments
      end

      def response_described_by?(message)
        !response || response.described_by?(message.response)
      end

      def to_hash
        {
          :name => name,
          :arguments => arguments,
          :response => (response && response.to_hash),
        }
      end
    end
  end
end
