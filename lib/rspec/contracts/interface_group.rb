require "rspec/contracts/interface"

module RSpec
  module Contracts
    class InterfaceGroup
      include Enumerable

      def initialize
        @collection = {}
      end

      def find_or_create(name)
        @collection[name] ||= Interface.new(name)
      end

      def each(&block)
        @collection.values.each(&block)
      end
    end
  end
end
