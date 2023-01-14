require_relative 'json_serializer'

module Xendit
  class Response
    attr_reader :status, :body

    def initialize(response)
      @status = response.status
      @body = JSONSerializer.decode(response.body)
    end

    def success?
      [200, 201].include?(@status)
    end

    def created?
      @status == 201
    end
  end
end