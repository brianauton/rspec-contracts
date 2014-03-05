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

      def matches?(interaction)
        [:interface_name, :method_name, :arguments, :return_value].select do |attribute|
          interaction.send(attribute) != send(attribute)
        end.empty?
      end

      def implemented_by?(interaction)
        [:interface_name, :method_name, :arguments].select do |attribute|
          interaction.send(attribute) != send(attribute)
        end.empty?
      end
    end
  end
end
