require_relative '../api_client'

module Xendit
  class Payout
    class << self
      def channels(**params)
        ApiClient.get "payouts_channels", params
      end
    end
  end
end
