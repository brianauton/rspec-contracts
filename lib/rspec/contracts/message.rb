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
        return false if message.name != name
        @specifications.each do |name, specification|
          unless specification.described_by? message.specifications[name]
            return false
          end
        end
        true
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
