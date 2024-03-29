module Kafka
  class Error < Exception
    def initialize(response : LibRdKafka::KafkaRespErr)
      message = String.new(LibRdKafka.rd_kafka_err2str(response))

      super(message)
    end

    def initialize(message : String)
      super(message)
    end
  end

  class ConnectionClosed < Exception
  end

  class ConfigError < Exception
  end
end