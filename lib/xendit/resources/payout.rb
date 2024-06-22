require_relative '../api_client'

module Xendit
  class Payout
    class << self
      def channels(**opts)
        ApiClient.get "payouts_channels", opts
      end

      def create(**opts)
        ApiClient.post "v2/payouts", opts
      end

      def cancel(id, **opts)
        ApiClient.post "v2/payouts/#{id}/cancel", opts
      end

      def get_by_id(id, **opts)
        ApiClient.get "v2/payouts/#{id}", opts
      end

      def get_by_reference_id(reference_id, **opts)
        ApiClient.get "v2/payouts", {reference_id: reference_id}, opts
      end
    end
  end
end
