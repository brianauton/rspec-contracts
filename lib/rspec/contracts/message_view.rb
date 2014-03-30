module RSpec
  module Contracts
    class MessageView
      def initialize(interface_name, message)
        @interface_name = interface_name
        @message = message
      end

      def render
        arg_string = @message.arguments ? "()" : ""
        return_string = @message.response ? "and return #{@message.response.value.inspect}" : ""
        "Interface '#{@interface_name}' must respond to '#{@message.name}#{arg_string}' #{return_string}"
      end
    end
  end
end
