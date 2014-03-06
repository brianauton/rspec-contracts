module RSpec
  module Contracts
    class InteractionView
      def initialize(interaction)
        @interaction = interaction
      end

      def render
        arg_string = @interaction.specifications[:arguments] ? "()" : ""
        return_string = @interaction.return_value ? "and return #{@interaction.return_value.inspect}" : ""
        "Interface '#{@interaction.interface_name}' must respond to '#{@interaction.method_name}#{arg_string}' #{return_string}"
      end
    end
  end
end
