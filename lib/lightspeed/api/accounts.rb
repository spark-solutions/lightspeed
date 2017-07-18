module Lightspeed
  module API
    class Accounts
      def initialize(client)
        @client = client
      end

      def all
        client.get("Account.json").body
      end

      private

      attr_reader :client
    end
  end
end
