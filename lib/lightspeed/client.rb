require "lightspeed/api/tokens"
require "lightspeed/api/accounts"
require "lightspeed/api/sales"
require "lightspeed/api/customers"
require "lightspeed/api/items"
require "lightspeed/api/categories"

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

    def get(url, params: {}, relations: [])
      conn.get(url, params.merge(load_relations: "[#{relation_names(relations)}]"))
    end

    def post(url, body: {})
      conn.post(url, body)
    end

    def delete(url)
      conn.delete(url)
    end

    def accounts; API::Accounts.new(self); end
    def sales; API::Sales.new(self); end
    def customers; API::Customers.new(self); end
    def items; API::Items.new(self); end
    def categories; API::Categories.new(self); end

    private

    def conn
      @conn ||= Faraday.new(API_BASE) do |f|
        f.authorization :Bearer, access_token if access_token
        f.request :json
        f.response :json, :content_type => /\bjson$/
        f.adapter Faraday.default_adapter
      end
    end

    def relation_names(relations)
      relations.map do |relation|
        "\"#{relation.to_s.camelize}\""
      end.join(",")
    end
  end
end
