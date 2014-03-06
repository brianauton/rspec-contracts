require "rspec/core"
require "rspec/contracts/interface"
require "rspec/contracts/interface_proxy"

module RSpec
  module Core
    class ExampleGroup
      def self.fulfill_contract(*interface_names)
        interface_names.each do |name|
          Contracts::InterfaceProxy.create Contracts::Interface.new(name), described_class
        end
      end
    end
  end
end
