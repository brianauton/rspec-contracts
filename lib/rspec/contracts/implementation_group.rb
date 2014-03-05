module RSpec
  module Contracts
    class ImplementationGroup
      attr_accessor :implementations

      def initialize
        @implementations = []
      end

      def exists?(interaction)
        @implementations.any?{|r| r.matches? interaction}
      end

      def add(interaction)
        implementations << interaction unless exists? interaction
      end
    end
  end
end
