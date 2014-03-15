require "rspec/contracts/message"
require "rspec/contracts/message_arguments"

module RSpec
  module Contracts
    class MethodProxy
      def self.create(*args)
        new(*args)
      end

      def add_message(options)
        message = Message.new(@method_name, options)
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
          message = method_proxy.add_message :arguments => MessageArguments.new(args)
          return_value = original_method.bind(self).call(*args)
          message.specifications[:return_value] = MessageReturn.new(return_value)
          return_value
        end
      end
    end
  end
end
