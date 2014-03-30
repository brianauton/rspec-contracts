require "rspec/contracts/message"

module RSpec
  module Contracts
    class MessageGroup
      def initialize(receiver, method_name, arguments = nil)
        @receiver = receiver
        add_message Message.new(method_name, arguments)
      end

      def add_message(message)
        @message = message
        @receiver.add_message @message
      end

      def set_arguments(arguments)
        @message.arguments = arguments
      end

      def add_response(response)
        add_message @message.without_response if @multiple_responses
        @message.response = response
        @multiple_responses = true
      end
    end
  end
end
