module RSpec
  module Contracts
    class MessageView
      def initialize(interface_name, message)
        @interface_name = interface_name
        @message = message
      end

      def render
        arg_string = @message.specifications[:arguments] ? "()" : ""
        return_string = @message.specifications[:return_value] ? "and return #{@message.specifications[:return_value].value.inspect}" : ""
        "Interface '#{@interface_name}' must respond to '#{@message.name}#{arg_string}' #{return_string}"
      end
    end
  end
end
