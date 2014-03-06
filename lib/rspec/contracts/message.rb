module RSpec
  module Contracts
    class Message
      attr_reader :interface_name, :method_name, :specifications

      def initialize(interface_name, method_name, specifications = {})
        @interface_name = interface_name
        @method_name = method_name
        @specifications = specifications
      end

      def fully_described_by?(message)
        [:interface_name, :method_name].select do |attribute|
          return false if message.send(attribute) != send(attribute)
        end
        @specifications.each do |name, specification|
          unless specification.fully_described_by? message.specifications[name]
            return false
          end
        end
        true
      end
    end
  end
end
