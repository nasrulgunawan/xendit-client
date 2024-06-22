require_relative '../api_client'

module Xendit
  class Refund
    class << self
      def create(**opts)
        ApiClient.post "refunds", opts
      end

      def list(**opts)
        ApiClient.get "refunds", opts
      end

      def get_by_id(id, **opts)
        ApiClient.get "refunds/#{id}", opts
      end
    end
  end
end
