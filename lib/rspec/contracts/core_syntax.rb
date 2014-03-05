require "rspec/core"
require "rspec/contracts/interface_proxy"

module RSpec
  module Core
    class ExampleGroup
      def self.fulfill_contract(*interface_names)
        interface_names.each do |interface_name|
          Contracts::InterfaceProxy.create interface_name, described_class
        end
      end
    end
  end
end
