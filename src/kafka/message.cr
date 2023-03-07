module Kafka
  class Message
    private property native_message : LibRdKafka::KafkaMessage

    delegate partition, offset, err, to: native_message

    def initialize(@native_message : LibRdKafka::KafkaMessage)
    end

    def topic
      String.new(LibRdKafka.rd_kafka_topic_name(native_message.rkt))
    end

    def payload
      @native_message.len > 0 ? String.new(@native_message.payload, @native_message.len) : nil
    end

    def key
      @native_message.key_len > 0 ? String.new(@native_message.key, @native_message.key_len) : nil
    end

    def timestamp
      raw_timestamp = LibRdKafka.rd_kafka_message_timestamp(native_message, nil)

      if raw_timestamp && raw_timestamp > -1
        Time.unix_ms(raw_timestamp)
      else
        nil
      end
    end
  end
end