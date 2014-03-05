require "rspec/contracts/core_syntax"
require "rspec/contracts/mocks_syntax"
require "rspec/contracts/fulfillment"
require "rspec/contracts/fulfillment_view"
require "rspec/contracts/interface"
require "rspec/core"

RSpec.configure do |c|
  c.after(:suite) do
    requirement_group = RSpec::Contracts::Interface.requirements
    implementation_group = RSpec::Contracts::Interface.implementations
    fulfillment = RSpec::Contracts::Fulfillment.new requirement_group, implementation_group
    print "\n" + RSpec::Contracts::FulfillmentView.new(fulfillment).render
  end
end
