require "rspec/contracts/method_proxy"

module RSpec
  module Contracts
    class InterfaceProxy
      def initialize(interface_name, proxied_class)
        proxied_class.instance_methods.select{|m| proxyable_method? m}.each do |method_name|
          MethodProxy.create interface_name, proxied_class, method_name
        end
      end

      def proxyable_method?(method_name)
        true
      end

      def self.create(*args)
        new(*args)
      end
    end
  end
end
