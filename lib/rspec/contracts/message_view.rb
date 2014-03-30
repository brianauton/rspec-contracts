module RSpec
  module Contracts
    class MessageView
      def initialize(interface_name, message)
        @interface_name = interface_name
        @message = message
      end

      def render
        arg_string = @message.arguments ? "()" : ""
        return_string = @message.response.respond_to?(:returned_value) ? "and return #{@message.response.returned_value.inspect}" : ""
        yield_string = @message.response.respond_to?(:yielded_value) ? "and return #{@message.response.yielded_value.inspect}" : ""
        "Interface '#{@interface_name}' must respond to '#{@message.name}#{arg_string}' #{return_string} #{yield_string}"
      end
    end
  end
end
