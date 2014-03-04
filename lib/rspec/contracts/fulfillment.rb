require "rspec/contracts/requirement"
require "rspec/contracts/requirement_view"

module RSpec
  module Contracts
    class Fulfillment
      def self.summary
        requirement_group.requirements.map do |requirement|
          RSpec::Contracts::RequirementView.new(requirement).render
        end.join "\n"
      end

      def self.requirement_group
        RSpec::Contracts::Requirement.group
      end
    end
  end
end
