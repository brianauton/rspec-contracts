require "rspec/contracts/core_syntax"
require "rspec/contracts/mocks_syntax"
require "rspec/contracts/fulfillment"
require "rspec/contracts/fulfillment_view"
require "rspec/contracts/implementor"
require "rspec/contracts/interface"
require "rspec/core"

RSpec.configure do |c|
  c.after(:suite) do
    interfaces = RSpec::Contracts::Interface.all
    implementors = RSpec::Contracts::Implementor.all
    fulfillment = RSpec::Contracts::Fulfillment.new interfaces, implementors
    print "\n" + RSpec::Contracts::FulfillmentView.new(fulfillment).render
  end
end
