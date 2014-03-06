module RSpec
  module Contracts
    class Interaction
      attr_reader :interface_name, :method_name, :arguments, :return_value

      def initialize(interface_name, method_name, options = {})
        @interface_name = interface_name
        @method_name = method_name
        @arguments = options[:arguments] || []
        @return_value = options[:return_value]
      end

      def fully_described_by?(interaction)
        [:interface_name, :method_name, :arguments, :return_value].select do |attribute|
          return false if interaction.send(attribute) != send(attribute)
        end
        true
      end
    end
  end
end
