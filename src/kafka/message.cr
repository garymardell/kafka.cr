module Kafka
  class Message
    property payload : String?

    def initialize(@native_message : LibRdKafka::KafkaMessage)
      @payload = @native_message.len > 0 ? String.new(@native_message.payload, @native_message.len) : nil
    end
  end
end