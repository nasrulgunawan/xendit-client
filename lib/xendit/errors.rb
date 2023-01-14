module Xendit
  class Errors < StandardError
    attr_reader :error_code, :error_message, :http_status

    def initialize(error_code, error_message, http_status)
      @error_code = error_code
      @error_message = error_message
      @http_status = http_status
      super(message_string)
    end

    private
    
    def message_string
      "Xendit API is returning API error. HTTP status #{@http_status}: #{@error_code}. Error message: #{@error_message}"
    end
  end
end