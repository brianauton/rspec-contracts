module RSpec
  module Contracts
    class Implementation
      def initialize(interface_name, method_name, options = {})
        @interface_name = interface_name
        @method_name = method_name
        @arguments = options[:arguments]
      end

      def self.create(*args)
        new(*args)
      end
    end
  end
end
