module Lightspeed
  module API
    class Customers
      def initialize(client)
        @client = client
      end

      def find(customer_id, with: [])
        client.get("Account/#{client.account_id}/Customer/#{customer_id}.json", relations: with).body
      end

      private

      attr_reader :client
    end
  end
end
