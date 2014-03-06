module RSpec
  module Contracts
    class MessageView
      def initialize(message)
        @message = message
      end

      def render
        arg_string = @message.specifications[:arguments] ? "()" : ""
        return_string = @message.specifications[:return_value] ? "and return #{@message.specifications[:return_value].value.inspect}" : ""
        "Interface '#{@message.interface_name}' must respond to '#{@message.method_name}#{arg_string}' #{return_string}"
      end
    end
  end
end
