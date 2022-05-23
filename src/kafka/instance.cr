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
        raise "Could not create kafka instance"
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
      when Type::Consumer
        LibRdKafka::KafkaType::RD_KAFKA_CONSUMER
      when Type::Producer
        LibRdKafka::KafkaType::RD_KAFKA_PRODUCER
      else
        raise "Unsupported instance type"
      end
    end
  end
end