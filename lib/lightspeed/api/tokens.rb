require "lightspeed/errors/missing_refresh_token"

module Lightspeed
  module API
    class Tokens
      REFRESH_TOKEN_URL = "https://cloud.merchantos.com/oauth/access_token.php"

      def initialize(client_id, client_secret, refresh_token)
        @client_id = client_id
        @client_secret = client_secret
        @refresh_token = refresh_token
      end

      def refresh
        raise Lightspeed::Errors::MissingRefreshToken unless refresh_token

        response = Faraday.post(
          REFRESH_TOKEN_URL,
          refresh_token: refresh_token,
          client_id: client_id,
          client_secret: client_secret,
          grant_type: "refresh_token",
        )

        JSON.parse(response.body)
      end

      private

      attr_reader :client_id, :client_secret, :refresh_token
    end
  end
end
