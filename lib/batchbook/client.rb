require "batchbook/client/version"
require "httparty"

module Batchbook
  class Client
    API_URL = "/api/v1/"

    def initialize(user, token)
      @token = "?auth_token=#{token.to_s}"
      @user = "#{user.to_s}#{API_URL}"
    end

    def ping
      response = get_users
      !response.has_key?("error")
    end

    def get_users(page = 1)
      get_request("users", "&page=#{page}")
    end

    def people_total
      get_people["total"]
    end

    def get_people(page = 1)
      get_request("people", "&page=#{page}")
    end

    def post_person(data, endpoint = "people")
      post_request(data, endpoint)
    end

    private

    def uri_generator(endpoint, options = "")
      "#{@user}#{endpoint}.json#{@token}#{options}"
    end

    def get_request(endpoint, options = "")
      response = HTTParty.get(uri_generator(endpoint, options))
      response.parsed_response
    end

    def post_request(data, endpoint, options = "")
     uri = uri_generator(endpoint, options)
     res = HTTParty.post(uri,
        :query => data,
        :header => { "Content-type" => "text/json"})
     res.response
    end
  end
end
