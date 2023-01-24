# frozen_string_literal: true

require_relative "xendit/version"
require_relative 'xendit/resources'
require_relative 'xendit/webhook'

module Xendit
  class << self
    attr_accessor :api_key, :callback_verification_token
    attr_writer :base_url

    def base_url
      @base_url ||= 'https://api.xendit.co/'
    end
  end
end