require "./errors"
require "./message"

module Kafka
  class Consumer
    private property instance : Kafka::Instance
    private property? closing : Bool

    def initialize(@config : Kafka::Config)
      @instance = Kafka::Instance.new(config, Kafka::Type::Consumer)
      @closing = false

      LibRdKafka.rd_kafka_poll_set_consumer(instance)
    end

    def close
      @closing = true

      instance.close
    end

    def subscribe(topics : Array(String))
      # TODO: Check for closed connection

      tpl = LibRdKafka.rd_kafka_topic_partition_list_new(topics.size)

      topics.each do |topic|
        LibRdKafka.rd_kafka_topic_partition_list_add(tpl, topic, 0)
      end

      # Subscribe to topic partition list and check this was successful
      response = LibRdKafka.rd_kafka_subscribe(instance, tpl)
      if response != LibRdKafka::KafkaRespErr::RD_KAFKA_RESP_ERR_NO_ERROR
        raise Kafka::Error.new(response, "Error subscribing to '#{topics.join(", ")}'")
      end
    ensure
      LibRdKafka.rd_kafka_topic_partition_list_destroy(tpl) unless tpl.nil?
    end

    def poll(timeout_ms : Int32)
      # TODO: Check for closed connection
      message_ptr = LibRdKafka.rd_kafka_consumer_poll(instance, timeout_ms)

      if message_ptr.null?
        nil
      else
        native_message = message_ptr.value

        if native_message.err != LibRdKafka::KafkaRespErr::RD_KAFKA_RESP_ERR_NO_ERROR
          raise "Error consuming messages"
        end

        Kafka::Message.new(native_message)
      end
    ensure
      if !message_ptr.nil? && !message_ptr.null?
        LibRdKafka.rd_kafka_message_destroy(message_ptr)
      end
    end

    def each
      loop do
        message = poll(5000)
        if message
          yield message
        else
          if closing?
            break
          else
            next
          end
        end
      end
    end

    def finalize
    end
  end
end
