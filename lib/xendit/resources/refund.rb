require_relative '../api_client'

module Xendit
  class Refund
    class << self
      def create(params)
        ApiClient.post "refunds", params
      end

      def list
        ApiClient.get "refunds"
      end

      def get_by_id(id)
        ApiClient.get "refunds/#{id}"
      end
    end
  end
end
