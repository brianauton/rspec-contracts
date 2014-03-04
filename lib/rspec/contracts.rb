require "rspec/contracts/mocks_syntax"
require "rspec/contracts/fulfillment"
require "rspec/core"

RSpec.configure do |c|
  c.after(:suite) do
    puts RSpec::Contracts::Fulfillment.summary
  end
end
