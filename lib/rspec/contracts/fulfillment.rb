require "rspec/contracts/interface_fulfillment"

module RSpec
  module Contracts
    class Fulfillment
      attr_reader :interface_fulfillments

      def initialize(interfaces)
        @interface_fulfillments = interfaces.map{ |i| InterfaceFulfillment.new i }
      end

      def complete?
        incomplete_interfaces.empty?
      end

      def incomplete_interfaces
        interface_fulfillments.reject(&:complete?)
      end

      def requirements_count
        interface_fulfillments.map(&:requirements_count).inject(&:+) || 0
      end
    end
  end
end
