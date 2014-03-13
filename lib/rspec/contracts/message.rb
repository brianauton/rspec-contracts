module RSpec
  module Contracts
    class Message
      attr_reader :method_name
      attr_accessor :specifications

      def initialize(method_name, specifications = {})
        @method_name = method_name
        @specifications = specifications
      end

      def fully_described_by?(message)
        return false if message.method_name != method_name
        @specifications.each do |name, specification|
          unless specification.fully_described_by? message.specifications[name]
            return false
          end
        end
        true
      end

      def to_hash
        {
          :method_name => method_name,
          :specifications => specifications.values.map(&:to_hash),
        }
      end
    end
  end
end
