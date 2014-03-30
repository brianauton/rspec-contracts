module RSpec
  module Contracts
    class UnspecifiedResponse
      def described_by?(response)
        true
      end

      def to_hash
        {}
      end
    end
  end
end
