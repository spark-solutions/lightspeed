module Lightspeed
  module API
    class Items
      class CustomFields
        class CustomFieldChoices
          def initialize(client)
            @client = client
          end

          def all(field_id)
            client.
              get("Account/#{client.account_id}/Item/CustomField/#{field_id}/CustomFieldChoice.json").
              body
          end

          private

          attr_reader :client
        end
      end
    end
  end
end
