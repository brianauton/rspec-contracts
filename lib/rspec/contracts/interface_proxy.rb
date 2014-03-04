module RSpec
  module Contracts
    class InterfaceProxy
      def initialize(proxied_class)
      end

      def self.create(*args)
        new(*args)
      end
    end
  end
end
