require "rspec/contracts/requirement"
require "rspec/contracts/requirement_view"

module RSpec
  module Contracts
    class Fulfillment
      def initialize(requirement_group)
        @requirement_group = requirement_group
      end

      def complete?
        false
      end

      def unfulfilled_requirements
        @requirement_group.requirements
      end

      def requirements_count
        @requirement_group.requirements.count
      end
    end
  end
end
