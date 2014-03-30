require "rspec/contracts/message"
require "rspec/contracts/returned_response"

module RSpec
  module Contracts
    class MethodProxy
      def self.create(*args)
        new(*args)
      end

      def add_message(arguments)
        message = Message.new @method_name
        message.arguments = arguments
        @implementor.add_message message
        message
      end

      private

      def initialize(implementor, proxied_class, method_name)
        @implementor = implementor
        @proxied_class = proxied_class
        @method_name = method_name
        install
      end

      def install
        original_method = @proxied_class.instance_method @method_name
        method_proxy = self
        @proxied_class.send :define_method, @method_name do |*args|
          message = method_proxy.add_message args
          return_value = original_method.bind(self).call(*args)
          message.specifications[:return_value] = ReturnedResponse.new(return_value)
          return_value
        end
      end
    end
  end
end
