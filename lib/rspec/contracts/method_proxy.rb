module RSpec
  module Contracts
    class MethodProxy
      def initialize(proxied_class, method_name)
      end

      def self.create(*args)
        new(*args)
      end
    end
  end
end
