require "rspec/mocks"
require "rspec/contracts/double"

module RSpec
  module Mocks
    module ExampleMethods
      def contract_double(*args)
        ExampleMethods.declare_double Contracts::Double, *args
      end
    end
  end
end
