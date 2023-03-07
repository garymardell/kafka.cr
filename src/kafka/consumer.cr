require "./errors"
require "./message"

module Kafka
  class Consumer
    private property instance : Kafka::Instance
    private property config : Kafka::Config
    private property? closing : Bool

    def initialize(@config : Kafka::Config)
      @instance = Kafka::Instance.new(config, Kafka::Type::Consumer)
      @closing = false

      LibRdKafka.rd_kafka_poll_set_consumer(instance)
    end

    def close
      return if closing?

      @closing = true
      LibRdKafka.rd_kafka_consumer_close(instance)
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
        raise Kafka::Error.new(response)
      end
    ensure
      LibRdKafka.rd_kafka_topic_partition_list_destroy(tpl) unless tpl.nil?
    end

    def unsubscribe
      check_closed_connection!

      resposne = LibRdKafka.rd_kafka_unsubscribe(instance)
      if response != LibRdKafka::KafkaRespErr::RD_KAFKA_RESP_ERR_NO_ERROR
        raise Kafka::Error.new(response)
      end
    end

    # TODO: pause
    # TODO: resume
    # TODO: subscription
    # TODO: assign
    # TODO: assignment
    # TODO: commited
    # TODO: query_watermark_offsets
    # TODO: lag

    def cluster_id
      check_closed_connection!

      String.new(LibRdKafka.rd_kafka_clusterid(instance))
    end

    def member_id
      check_closed_connection!

      String.new(LibRdKafka.rd_kafka_memberid(instance))
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

    def store_offset(message)
      native_topic = LibRdKafka.rd_kafka_topic_new(instance, message.topic, nil)

      response = LibRdKafka.rd_kafka_offset_store(
        native_topic,
        message.partition,
        message.offset
      )

      if response != LibRdKafka::KafkaRespErr::RD_KAFKA_RESP_ERR_NO_ERROR
        raise "Error storing offset"
      end
    ensure
      if native_topic && !native_topic.null?
        LibRdKafka.rd_kafka_topic_destroy(native_topic)
      end
    end

    def seek(message : Kafka::Message)
      native_topic = LibRdKafka.rd_kafka_topic_new(
        instance,
        message.topic,
        nil
      )

      response = LibRdKafka.rd_kafka_seek(
        native_topic,
        message.partition,
        message.offset,
        0 # timeout
      )

      if response != LibRdKafka::KafkaRespErr::RD_KAFKA_RESP_ERR_NO_ERROR
        raise "error"
      end
    ensure
      if native_topic && !native_topic.null?
        LibRdKafka.rd_kafka_topic_destroy(native_topic)
      end
    end

    def each_batch(size : Int32, timeout_ms : Int32)
      raise "Invalid configuration" unless config.values["enable.auto.offset.store"]? == "false"

      messages = Array(Kafka::Message).new(size)
      start_time = Time.monotonic

      loop do
        break if closing?

        begin
          message = poll(5000)
          messages << message if message
        rescue e
          yield messages.dup if messages.any?
          raise e
        end

        now = Time.monotonic
        duration = now - start_time

        if messages.size > size || duration.total_milliseconds >= timeout_ms
          if messages.any?
            yield messages.dup
            messages.clear
          end

          start_time = now
        end
      end
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
