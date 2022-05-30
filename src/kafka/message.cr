module Kafka
  class Message
    property payload : String?
    private property native_message : LibRdKafka::KafkaMessage

    delegate partition, offset, to: native_message

    def initialize(@native_message : LibRdKafka::KafkaMessage)
      @payload = @native_message.len > 0 ? String.new(@native_message.payload, @native_message.len) : nil
    end

    def topic
      LibRdKafka.rd_kafka_topic_name(native_message.rkt)
    end
  end
end