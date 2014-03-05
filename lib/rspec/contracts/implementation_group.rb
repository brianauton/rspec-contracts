module RSpec
  module Contracts
    class ImplementationGroup
      attr_accessor :implementations

      def initialize
        @implementations = []
      end

      def exists?(implementation)
        @implementations.any?{|r| r.matches? implementation}
      end

      def add(implementation)
        implementations << implementation unless exists? implementation
      end
    end
  end
end
