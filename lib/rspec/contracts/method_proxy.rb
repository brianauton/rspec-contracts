require "rspec/contracts/argument_specification"

module RSpec
  module Contracts
    class MethodProxy
      def self.create(*args)
        new(*args)
      end

      def create_implementation(options)
        @interface.add_implementation @method_name, options
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
          method_proxy.create_implementation :arguments => ArgumentSpecification.new(args)
          original_method.bind(self).call(*args)
        end
      end
    end
  end
end
