# frozen_string_literal: true

require_relative "xendit/version"
require_relative 'xendit/resources'

module Xendit
  class << self
    attr_accessor :api_key
    attr_writer :base_url

    def base_url
      @base_url ||= 'https://api.xendit.co/'
    end
  end
end