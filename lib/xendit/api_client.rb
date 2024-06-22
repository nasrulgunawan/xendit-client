require 'faraday'
require_relative 'json_serializer'
require_relative 'response'
require_relative 'errors'

module Xendit
  class ApiClient
    class << self
      def get(url, headers: {}, params: nil)
        conn = create_connection(headers)
        response = conn.get(url, params)
        handle_response(response)
      end

      def post(url, headers: {}, body: {})
        conn = create_connection(headers)
        response = conn.post(url, JSONSerializer.encode(body))
        handle_response(response)
      end

      private

      def create_connection(additional_headers = {})
        if Xendit.api_key.nil? || Xendit.api_key == ""
          raise "Please configure your API key"
        end

        default_headers =  {
          "Accept" => "application/json",
          "Content-Type" => "application/json",
          "User-Agent" => "Xendit ruby client library #{Xendit::VERSION}"
        }

        default_headers = default_headers.merge!(additional_headers) if additional_headers != {}

        Faraday.new(
          url: Xendit.base_url,
          headers: default_headers
        ) do |conn|
          conn.request :authorization, :basic, Xendit.api_key, ''
        end
      end

      def handle_response(response)
        raise ArgumentError, "Invalid response" if response.nil?

        if response.status >= 400
          response_body = JSONSerializer.decode(response.body)
          raise Xendit::Errors.new(response_body['error_code'], response_body['message'], response.status)
        end

        Xendit::Response.new(response)
      end
    end
  end
end
