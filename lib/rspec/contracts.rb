require "rspec/contracts/core_syntax"
require "rspec/contracts/mocks_syntax"
require "rspec/contracts/fulfillment"
require "rspec/contracts/fulfillment_view"
require "rspec/contracts/interface"
require "rspec/core"

RSpec.configure do |c|
  c.after(:suite) do
    requirements = RSpec::Contracts::Interface.requirements
    implementations = RSpec::Contracts::Interface.implementations
    fulfillment = RSpec::Contracts::Fulfillment.new requirements, implementations
    print "\n" + RSpec::Contracts::FulfillmentView.new(fulfillment).render
  end
end
