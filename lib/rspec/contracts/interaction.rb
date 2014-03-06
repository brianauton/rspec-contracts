require "rspec/contracts/argument_specification"
require "rspec/contracts/return_specification"

module RSpec
  module Contracts
    class Interaction
      attr_reader :interface_name, :method_name, :specifications

      def initialize(interface_name, method_name, options = {})
        @interface_name = interface_name
        @method_name = method_name
        @specifications = {}
        if options[:arguments]
          @specifications[:arguments] = ArgumentSpecification.new(options[:arguments])
        end
        if options[:return_value]
          @specifications[:return_value] = ReturnSpecification.new(options[:return_value])
        end
      end

      def fully_described_by?(interaction)
        [:interface_name, :method_name].select do |attribute|
          return false if interaction.send(attribute) != send(attribute)
        end
        @specifications.each do |name, specification|
          unless specification.fully_described_by? interaction.specifications[name]
            return false
          end
        end
        true
      end
    end
  end
end
