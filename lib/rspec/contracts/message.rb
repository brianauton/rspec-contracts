module RSpec
  module Contracts
    class Message
      attr_reader :name
      attr_accessor :arguments, :specifications

      def initialize(name)
        @name = name
        @specifications = {}
      end

      def described_by?(message)
        [:name, :arguments, :specifications].all? { |n| send "#{n}_described_by?", message }
      end

      def name_described_by?(message)
        message.name == name
      end

      def arguments_described_by?(message)
        arguments.nil? || arguments == message.arguments
      end

      def specifications_described_by?(message)
        @specifications.all? do |name, specification|
          specification.described_by? message.specifications[name]
        end
      end

      def to_hash
        {
          :name => name,
          :arguments => arguments,
          :specifications => specifications.values.map(&:to_hash),
        }
      end
    end
  end
end
