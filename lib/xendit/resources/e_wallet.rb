require_relative '../api_client'

module Xendit
  class EWallet
    PATH = "ewallets".freeze

    class << self
      def get_charge_status(charge_id)
        ApiClient.get "#{PATH}/#{charge_id}"
      end

      def charge(body)
        ApiClient.post "#{PATH}/charges", body
      end

      def void_charge(charge_id)
        ApiClient.post "#{PATH}/#{charge_id}/void"
      end

      def refund(charge_id, body)
        ApiClient.post "#{PATH}/#{charge_id}/refunds", body
      end

      def get_refund(charge_id, refund_id)
        ApiClient.get "#{PATH}/#{charge_id}/refunds/#{refund_id}"
      end

      def list_refunds
        ApiClient.get "#{PATH}/#{charge_id}/refunds"
      end
    end
  end
end
