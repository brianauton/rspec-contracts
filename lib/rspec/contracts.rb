require "rspec/contracts/mocks_syntax"
require "rspec/contracts/requirement"
require "rspec/core"

RSpec.configure do |c|
  c.after(:suite) do
    RSpec::Contracts::Requirement.group.requirements.each do |requirement|
      puts RSpec::Contracts::RequirementView.new(requirement).render
    end
  end
end
