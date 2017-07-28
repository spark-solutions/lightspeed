module Lightspeed
  module API
    class Items
      def initialize(client)
        @client = client
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

      private

      attr_reader :client
    end
  end
end
