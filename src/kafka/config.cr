module Kafka
  class Config
    property values : Hash(String, String)

    def initialize(@values : Hash(String, String))
      @native_config = LibRdKafka.rd_kafka_conf_new()

      @values.each do |key, value|
        error = Slice(LibC::Char).new(512)
        result = LibRdKafka.rd_kafka_conf_set(@native_config, key, value, error.to_unsafe, error.bytesize)

        if result != LibRdKafka::KafkaConfRes::RD_KAFKA_CONF_OK
          raise Kafka::ConfigError.new(String.new(error))
        end
      end
    end

    def to_unsafe
      @native_config
    end
  end
end