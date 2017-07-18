require "lightspeed/errors/missing_refresh_token"

module Lightspeed
  module API
    class Tokens
      REFRESH_TOKEN_URL = "https://cloud.merchantos.com/oauth/access_token.php"

      def initialize(client)
        @client = client
      end

      def refresh
        raise Lightspeed::Errors::MissingRefreshToken unless client.refresh_token

        response = Faraday.post(
          REFRESH_TOKEN_URL,
          refresh_token: client.refresh_token,
          client_id: client.client_id,
          client_secret: client.client_secret,
          grant_type: "refresh_token",
        )

        JSON.parse(response.body)
      end

      private

      attr_reader :client
    end
  end
end
