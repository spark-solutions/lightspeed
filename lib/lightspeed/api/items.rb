require "lightspeed/api/items/custom_fields"

module Lightspeed
  module API
    class Items
      def initialize(client)
        @client = client
      end

      def custom_fields; Items::CustomFields.new(client); end

      def all
        client.get("Account/#{client.account_id}/Item.json").body
      end

      def find(item_id, with: [])
        client.get("Account/#{client.account_id}/Item/#{item_id}.json", relations: with).body
      end

      def create(attributes = {})
        client.post("Account/#{client.account_id}/Item.json", body: attributes).body
      end

      def archive(item_id)
        client.delete("Account/#{client.account_id}/Item/#{item_id}.json").body
      end

      def update(item_id, attributes = {})
        client.put("Account/#{client.account_id}/Item/#{item_id}.json", body: attributes).body
      end

      private

      attr_reader :client
    end
  end
end
