require_relative '../api_client'

module Xendit
  class Invoice 
    class << self
      def get(invoice_id)
        ApiClient.get "v2/invoices/#{invoice_id}"
      end

      def create(params)
        ApiClient.post "v2/invoices/", params
      end

      def expire(invoice_id)
        ApiClient.post "invoices/#{invoice_id}/expire!"
      end

      def get_all
        ApiClient.get "v2/invoices"
      end
    end
  end
end