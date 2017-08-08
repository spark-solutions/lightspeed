module Lightspeed
  module API
    class Customers
      def initialize(client)
        @client = client
      end

      def find(customer_id, with: [])
        client.get("Account/#{client.account_id}/Customer/#{customer_id}.json", relations: with).body
      end

      def create(attributes = {})
        client.post("Account/#{client.account_id}/Customer.json", body: attributes).body
      end

      def update(customer_id, attributes = {})
        client.put("Account/#{client.account_id}/Customer/#{customer_id}.json", body: attributes)
      end

      private

      attr_reader :client
    end
  end
end
