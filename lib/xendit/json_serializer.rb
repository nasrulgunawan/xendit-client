module Xendit
  class JSONSerializer
    class << self
      # If you using Rails then it will call ActiveSupport::JSON.encode
      # Otherwise JSON.pretty_generate
      def encode(params)
        if defined?(ActiveSupport) && defined?(ActiveSupport::JSON)
          ActiveSupport::JSON.encode(params)
        else
          require 'json' unless defined?(JSON)
          JSON.pretty_generate(params)
        end
      end

      # If you using Rails then it will call ActiveSupport::JSON.decode
      # Otherwise JSON.parse
      def decode(params)
        if defined?(ActiveSupport) && defined?(ActiveSupport::JSON)
          ActiveSupport::JSON.decode(params)
        else
          require 'json' unless defined?(JSON)
          JSON.parse(params)
        end
      end
    end
  end
end
