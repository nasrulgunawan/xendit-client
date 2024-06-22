require_relative '../api_client'

module Xendit
  class EWallet
    PATH = "ewallets/charges".freeze

    class << self
      def get_charge_status(charge_id, **opts)
        ApiClient.get "#{PATH}/#{charge_id}", opts
      end

      def charge(**opts)
        ApiClient.post PATH, opts
      end

      def void_charge(charge_id, **opts)
        ApiClient.post "#{PATH}/#{charge_id}/void", opts
      end

      def refund(charge_id, **opts)
        ApiClient.post "#{PATH}/#{charge_id}/refunds", opts
      end

      def get_refund(charge_id, refund_id, **opts)
        ApiClient.get "#{PATH}/#{charge_id}/refunds/#{refund_id}", opts
      end

      def list_refunds(**opts)
        ApiClient.get "#{PATH}/#{charge_id}/refunds", opts
      end
    end
  end
end
