module Lightspeed
  module API
    class Categories
      def initialize(client)
        @client = client
      end

      def all
        client.get("Account/#{client.account_id}/Category.json").body
      end

      def find(item_id, with: [])
        client.get("Account/#{client.account_id}/Category/#{item_id}.json", relations: with).body
      end

      private

      attr_reader :client

      def chosen_relations(with)
        with.map do |relation|
          relation.to_s.camelize
        end
      end
    end
  end
end
