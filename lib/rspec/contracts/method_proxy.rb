module RSpec
  module Contracts
    class MethodProxy
      def self.create(*args)
        new(*args)
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
        @proxied_class.send :define_method, @method_name do |*args|
          original_method.bind(self).call(*args)
        end
      end
    end
  end
end
