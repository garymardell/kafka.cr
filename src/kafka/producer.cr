require "./delivery_handle"

module Kafka
  class Producer
    property? closing : Bool
    private property instance : Kafka::Instance
    private property shutdown : Channel(Bool)
    private property signal : Channel(Bool)

    def initialize(@config : Kafka::Config)
      callback = Proc(LibRdKafka::Kafka, LibRdKafka::KafkaMessage*, Void*, Nil).new { |kafka, message, opaque|
        native_message = message.value

        handle = Box(Kafka::DeliveryHandle).unbox(native_message._private)
        handle.mark_done

        DeliveryHandle.registry.delete(handle)

        nil
      }

      LibRdKafka.rd_kafka_conf_set_dr_msg_cb(@config, callback)

      @instance = Kafka::Instance.new(@config, Kafka::Type::Producer)
      @closing = false
      @shutdown = Channel(Bool).new
      @signal = Channel(Bool).new

      spawn do
        loop do
          LibRdKafka.rd_kafka_poll(instance, 0)

          sleep 0.25

          if @shutdown.closed? && LibRdKafka.rd_kafka_outq_len(instance) == 0
            @signal.send(true)
            break
          end
        end
      end
    end

    def produce(topic : String, payload : String, key : String = "", partition : Int32 = -1)
      check_closed_connection!

      native_topic = LibRdKafka.rd_kafka_topic_new(instance, topic, nil)

      handle = Kafka::DeliveryHandle.new

      # Register the handle so it does not get gc'd
      DeliveryHandle.registry << handle

      LibRdKafka.rd_kafka_produce(native_topic, partition, LibRdKafka::RD_KAFKA_MSG_F_COPY, payload, payload.bytesize, key, key.bytesize, Box.box(handle))

      handle
    rescue e
      DeliveryHandle.registry.delete(handle) if handle
      raise e
    ensure
      if native_topic && !native_topic.null?
        LibRdKafka.rd_kafka_topic_destroy(native_topic)
      end
    end

    def flush
      LibRdKafka.rd_kafka_flush(instance, 5000)
    end

    def close
      @closing = true

      # Close channel to tell the polling loop to stop
      shutdown.close

      # Wait for the signal from the polling loop that it has finished and the queue has been drained
      signal.receive

      # Close underlying kafka instance now there are no more pending messages
      instance.close
    end

    def finalize
      close
    end

    macro check_closed_connection!
      if closing?
        raise Kafka::ConnectionClosed.new("Connection has been closed")
      end
    end
  end
end
