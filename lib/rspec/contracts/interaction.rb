module RSpec
  module Contracts
    class Interaction
      attr_reader :interface_name, :method_name, :specifications

      def initialize(interface_name, method_name, specifications = {})
        @interface_name = interface_name
        @method_name = method_name
        @specifications = specifications
      end

      def fully_described_by?(interaction)
        [:interface_name, :method_name].select do |attribute|
          return false if interaction.send(attribute) != send(attribute)
        end
        @specifications.each do |name, specification|
          unless specification.fully_described_by? interaction.specifications[name]
            return false
          end
        end
        true
      end
    end
  end
end
