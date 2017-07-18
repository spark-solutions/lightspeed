require "lightspeed/api/tokens"
require "lightspeed/api/accounts"

module Lightspeed
  class Client
    API_BASE = "https://api.merchantos.com/API/"

    attr_reader :client_id, :client_secret, :access_token, :refresh_token

    def initialize(client_id:, client_secret:, access_token:, refresh_token:)
      @client_id = client_id
      @client_secret = client_secret
      @access_token = access_token
      @refresh_token = refresh_token
    end

    def get(url, params: {})
      conn.get(url, params)
    end

    def tokens; API::Tokens.new(self); end
    def accounts; API::Accounts.new(self); end

    private

    def conn
      @conn ||= Faraday.new(API_BASE) do |f|
        f.authorization :Bearer, access_token if access_token
        f.request :json
        f.response :json, :content_type => /\bjson$/
        f.adapter Faraday.default_adapter
      end
    end
  end
end
