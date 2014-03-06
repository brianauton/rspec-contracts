require "rspec/core"
require "rspec/contracts/interface"
require "rspec/contracts/interface_proxy"

module RSpec
  module Core
    class ExampleGroup
      def self.fulfill_contract(*interface_names)
        interface_names.each do |name|
          interface = Contracts::Interface.find_or_create name
          Contracts::InterfaceProxy.create interface, described_class
        end
      end
    end
  end
end
