require "rspec/contracts/interface"
require "rspec/contracts/interaction"

module RSpec
  module Contracts
    class MethodProxy
      def self.create(*args)
        new(*args)
      end

      def create_interface(options)
        implementation = Interaction.new @interface_name, @method_name, options
        Interface.add_implementation implementation
      end

      private

      def initialize(interface_name, proxied_class, method_name)
        @interface_name = interface_name
        @proxied_class = proxied_class
        @method_name = method_name
        install
      end

      def install
        original_method = @proxied_class.instance_method @method_name
        method_proxy = self
        @proxied_class.send :define_method, @method_name do |*args|
          method_proxy.create_interface :arguments => args
          original_method.bind(self).call(*args)
        end
      end
    end
  end
end
