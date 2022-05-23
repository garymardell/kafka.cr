module Kafka
  class Error < Exception
    def initialize(response, message : String? = nil)
      super(message)
    end

    def initialize(message : String)
      super(message)
    end
  end
end