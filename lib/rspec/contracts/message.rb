module RSpec
  module Contracts
    class Message
      attr_reader :name
      attr_accessor :specifications

      def initialize(name, specifications = {})
        @name = name
        @specifications = specifications
      end

      def described_by?(message)
        name_described_by?(message) && specifications_described_by?(message)
      end

      def name_described_by?(message)
        message.name == name
      end

      def specifications_described_by?(message)
        @specifications.all? do |name, specification|
          specification.described_by? message.specifications[name]
        end
      end

      def to_hash
        {
          :name => name,
          :specifications => specifications.values.map(&:to_hash),
        }
      end
    end
  end
end
