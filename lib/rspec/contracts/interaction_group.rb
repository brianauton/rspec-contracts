module RSpec
  module Contracts
    class InteractionGroup
      include Enumerable
      attr_accessor :interactions

      def initialize
        @interactions = []
      end

      def exists?(interaction)
        @interactions.any? { |i| interaction.fully_described_by? i }
      end

      def add(interaction)
        @interactions << interaction unless exists? interaction
      end

      def each(&block)
        @interactions.each(&block)
      end
    end
  end
end
