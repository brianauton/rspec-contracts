require "rspec/contracts/message_view"

module RSpec
  module Contracts
    class FulfillmentView
      def initialize(fulfillment)
        @fulfillment = fulfillment
      end

      def render
        ([summary] + unfulfilled_views).join "\n"
      end

      def summary
        unverified = unfulfilled_views.count
        verified = @fulfillment.messages_count - unverified
        "#{contracts_count}, #{verified} verified, #{unverified} unverified"
      end

      def unfulfilled_views
        @fulfillment.incomplete_interfaces.map do |fulfillment|
          fulfillment.unfulfilled_messages.map do |message|
            RSpec::Contracts::MessageView.new(fulfillment.interface.name, message).render
          end
        end
      end

      def contracts_count
        pluralize @fulfillment.messages_count, "contract"
      end

      def pluralize(number, noun)
        suffix = (number == 1) ? "" : "s"
        "#{number} #{noun}#{suffix}"
      end
    end
  end
end
