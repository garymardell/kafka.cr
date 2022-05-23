module Kafka
  class DeliveryHandle
    property? pending : Bool

    def initialize
      @pending = true
    end
  end
end