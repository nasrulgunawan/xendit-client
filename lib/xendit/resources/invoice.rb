require_relative '../api_client'

module Xendit
  class Invoice
    class << self
      def get(invoice_id, **opts)
        ApiClient.get "v2/invoices/#{invoice_id}", opts
      end

      def create(**opts)
        ApiClient.post "v2/invoices/", opts
      end

      def expire(invoice_id, **opts)
        ApiClient.post "invoices/#{invoice_id}/expire!", opts
      end

      def get_all(**opts)
        ApiClient.get "v2/invoices", opts
      end
    end
  end
end
