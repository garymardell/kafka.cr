module Kafka
  class DeliveryHandle
    class_getter(registry) {
      Set(DeliveryHandle).new
    }

    getter? pending : Bool

    def initialize
      @pending = true
      @channel = Channel(Bool).new
    end

    def mark_done
      @pending = false
      @channel.send(true)
    end

    def wait
      @channel.receive
      nil
    end
  end
end