require "rspec/contracts/core_syntax"
require "rspec/contracts/mocks_syntax"
require "rspec/contracts/fulfillment"
require "rspec/contracts/fulfillment_view"
require "rspec/contracts/interface"
require "rspec/core"

RSpec.configure do |c|
  c.after(:suite) do
    fulfillment = RSpec::Contracts::Fulfillment.new RSpec::Contracts::Interface.all.values
    print "\n" + RSpec::Contracts::FulfillmentView.new(fulfillment).render
  end
end
