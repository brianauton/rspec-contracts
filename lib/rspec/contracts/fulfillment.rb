require "rspec/contracts/interface_fulfillment"

module RSpec
  module Contracts
    class Fulfillment
      attr_reader :interface_fulfillments

      def initialize(interfaces, implementors)
        @implementors = implementors
        @interface_fulfillments = interfaces.map do |interface|
          InterfaceFulfillment.new interface, implementors_for(interface)
        end
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

      def implementors_for(interface)
        @implementors.select{ |i| i.interface_names.include? interface.name }
      end
    end
  end
end
