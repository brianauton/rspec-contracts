module RSpec
  module Mocks
    module ExampleMethods
      def contract_double(*args)
        ExampleMethods.declare_double ContractDouble, *args
      end
    end
  end
end
