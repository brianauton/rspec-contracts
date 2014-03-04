require "rspec/core/example_group"
require "rspec/contracts/interface_proxy"

module RSpec
  module Core
    class ExampleGroup
      def self.fulfill_contract(*interface_names)
        interface_names.each do |interface_name|
          Contracts::InterfaceProxy.create described_class
        end
      end
    end
  end
end
