require "rspec/contracts/message_view"

module RSpec
  module Contracts
    class FulfillmentView
      def initialize(fulfillment)
        @fulfillment = fulfillment
      end

      def render
        @fulfillment.complete? ? render_complete : render_incomplete
      end

      def render_complete
        "#{@fulfillment.requirements_count} of #{contracts_count} verified."
      end

      def render_incomplete
        lines = unfulfilled_views
        lines.unshift("WARNING: #{unfulfilled_views.count} of #{contracts_count} unverified.")
        lines.join "\n"
      end

      def unfulfilled_views
        @fulfillment.unfulfilled_requirements.map do |requirement|
          RSpec::Contracts::MessageView.new(requirement).render
        end
      end

      def contracts_count
        pluralize @fulfillment.requirements_count, "contract"
      end

      def pluralize(number, noun)
        suffix = (number == 1) ? "" : "s"
        "#{number} #{noun}#{suffix}"
      end
    end
  end
end
