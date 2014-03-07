require "rspec/contracts/message"
require "rspec/contracts/message_arguments"

module RSpec
  module Contracts
    class MethodProxy
      def self.create(*args)
        new(*args)
      end

      def add_implementation(options)
        @interface.add_implementation Message.new(@method_name, options)
      end

      private

      def initialize(interface, proxied_class, method_name)
        @interface = interface
        @proxied_class = proxied_class
        @method_name = method_name
        install
      end

      def install
        original_method = @proxied_class.instance_method @method_name
        method_proxy = self
        @proxied_class.send :define_method, @method_name do |*args|
          method_proxy.add_implementation :arguments => MessageArguments.new(args)
          original_method.bind(self).call(*args)
        end
      end
    end
  end
end
