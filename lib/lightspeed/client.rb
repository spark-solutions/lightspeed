require "lightspeed/api/tokens"

module Lightspeed
  class Client
    API_BASE = "https://api.merchantos.com/API"

    attr_reader :client_id, :client_secret, :access_token, :refresh_token

    def initialize(client_id:, client_secret:, access_token:, refresh_token:)
      @client_id = client_id
      @client_secret = client_secret
      @access_token = access_token
      @refresh_token = refresh_token
    end

    def tokens; API::Tokens.new(self); end
  end
end
