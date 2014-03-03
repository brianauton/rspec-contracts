require "rspec/mocks/test_double"
require "rspec/contracts/contract_proxy"

module RSpec
  module Contracts
    class Double
      include Mocks::TestDouble

      def initialize(contract_name, *args)
        @contract_name = contract_name
        __initialize_as_test_double contract_name, *args
      end

      def __build_mock_proxy(order_group)
        Mocks::ContractProxy.new self, order_group, @contract_name
      end
    end
  end
end
