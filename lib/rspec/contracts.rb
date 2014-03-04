require "rspec/contracts/core_syntax"
require "rspec/contracts/mocks_syntax"
require "rspec/contracts/fulfillment"
require "rspec/contracts/fulfillment_view"
require "rspec/contracts/requirement"
require "rspec/core"

RSpec.configure do |c|
  c.after(:suite) do
    requirement_group = RSpec::Contracts::Requirement.group
    fulfillment = RSpec::Contracts::Fulfillment.new requirement_group
    print "\n" + RSpec::Contracts::FulfillmentView.new(fulfillment).render
  end
end
