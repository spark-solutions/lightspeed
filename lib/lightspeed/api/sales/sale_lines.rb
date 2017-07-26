module Lightspeed
  module API
    class Sales
      class SaleLines
        def initialize(client)
          @client = client
        end

        def all(sale_id)
          client.
            get("Account/#{client.account_id}/Sale/#{sale_id}/SaleLine.json").
            body
        end

        def create(attributes = {})
          client.post("Account/#{client.account_id}/Sale/#{attributes[:saleID]}/SaleLine.json", body: attributes).body
        end

        private

        attr_reader :client
      end
    end
  end
end
