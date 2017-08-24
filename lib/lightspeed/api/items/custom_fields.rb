require "lightspeed/api/items/custom_fields/custom_field_choices"

module Lightspeed
  module API
    class Items
      class CustomFields
        def initialize(client)
          @client = client
        end

        def custom_field_choices; API::Items::CustomFields::CustomFieldChoices.new(client); end

        def all
          client.
            get("Account/#{client.account_id}/Item/CustomField.json").
            body
        end

        private

        attr_reader :client
      end
    end
  end
end
