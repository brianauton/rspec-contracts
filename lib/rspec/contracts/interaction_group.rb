module RSpec
  module Contracts
    class InteractionGroup
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
    end
  end
end
