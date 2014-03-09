require "rspec/contracts/message"
require "rspec/contracts/message_arguments"

module RSpec
  module Contracts
    class MethodProxy
      def self.create(*args)
        new(*args)
      end

      def add_message(options)
        @implementor.add_message Message.new(@method_name, options)
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
          method_proxy.add_message :arguments => MessageArguments.new(args)
          original_method.bind(self).call(*args)
        end
      end
    end
  end
end
