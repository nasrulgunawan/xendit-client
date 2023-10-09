require_relative '../api_client'

module Xendit
  class Payout
    class << self
      def channels(**params)
        ApiClient.get "payouts_channels", params
      end

      def create(params)
        ApiClient.post "v2/payouts", params
      end

      def cancel(id)
        ApiClient.post "v2/payouts/#{id}/cancel"
      end

      def get_by_id(id)
        ApiClient.get "v2/payouts/#{id}"
      end

      def get_by_reference_id(reference_id)
        ApiClient.get "v2/payouts", {reference_id: reference_id}
      end
    end
  end
end
