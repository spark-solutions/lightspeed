require "lightspeed/api/sales/sale_lines"

module Lightspeed
  module API
    class Sales
      def initialize(client)
        @client = client
      end

      def sale_lines; API::Sales::SaleLines.new(client); end

      def find(sale_id, with: [])
        client.get("Account/#{client.account_id}/Sale/#{sale_id}.json", relations: with).body
      end

      private

      attr_reader :client
    end
  end
end
