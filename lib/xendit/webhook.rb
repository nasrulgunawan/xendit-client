require_relative 'json_serializer'

module Xendit
  class Webhook
    def initialize(request)
      if Xendit.callback_verification_token.nil? || Xendit.callback_verification_token == ""
        raise "Please configure your Callback Verification Token" 
      end

      @request = request
    end

    def verified?
      secure_compare(Xendit.callback_verification_token, @request.headers["X-CALLBACK-TOKEN"])
    end

    def data
      verified? ? JSONSerializer.decode(@request.body.read) : {"error" => "The source not verified"}
    end

    private

    def secure_compare(a, b)
      return false if a.blank? || b.blank? || a.bytesize != b.bytesize
      l = a.unpack "C#{a.bytesize}"
    
      res = 0
      b.each_byte { |byte| res |= byte ^ l.shift }
      res == 0
    end
  end
end