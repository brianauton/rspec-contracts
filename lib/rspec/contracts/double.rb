require "rspec/mocks"
require "rspec/contracts/interface"
require "rspec/contracts/mock_proxy"

module RSpec
  module Contracts
    class Double
      include Mocks::TestDouble

      def initialize(interface_name, *args)
        @interface = Interface.find_or_create interface_name
        super
      end

      def __build_mock_proxy(order_group)
        MockProxy.new self, order_group, @interface
      end
    end
  end
end
