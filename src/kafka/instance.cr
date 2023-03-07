require "./config"

module Kafka
  enum Type
    Consumer
    Producer
  end

  class Instance
    property? closed : Bool
    property config : Kafka::Config
    private property type : Kafka::Type

    def initialize(@config : Kafka::Config, @type : Kafka::Type)
      error = Slice(LibC::Char).new(256)

      @native_kafka = LibRdKafka.rd_kafka_new(native_type, @config.to_unsafe, error.to_unsafe, error.bytesize)

      if @native_kafka.null?
        raise Kafka::Error.new(String.new(error))
      end

      @closed = false
    end

    def close
      return if closed?

      @closed = true
      LibRdKafka.rd_kafka_destroy(@native_kafka)
    end

    def to_unsafe
      @native_kafka
    end

    private def native_type
      case type
      in Type::Consumer
        LibRdKafka::KafkaType::RD_KAFKA_CONSUMER
      in Type::Producer
        LibRdKafka::KafkaType::RD_KAFKA_PRODUCER
      end
    end
  end
end