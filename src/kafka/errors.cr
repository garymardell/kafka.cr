module Kafka
  class Error < Exception
    def initialize(response : LibRdKafka::KafkaRespErr)
      message = String.new(LibRdKafka.rd_kafka_err2str(response))

      super(message)
    end
  end

  class ConnectionClosed < Exception
  end
end