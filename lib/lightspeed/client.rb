require "lightspeed/api/tokens"
require "lightspeed/api/accounts"

module Lightspeed
  class Client
    API_BASE = "https://api.merchantos.com/API/"

    attr_reader :access_token, :account_id

    def self.tokens(client_id:, client_secret:, refresh_token:)
      API::Tokens.new(client_id, client_secret, refresh_token)
    end

    def initialize(access_token:, account_id:)
      @access_token = access_token
      @account_id = account_id
    end

    def get(url, params: {})
      conn.get(url, params)
    end

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
