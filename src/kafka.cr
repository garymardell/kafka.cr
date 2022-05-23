require "./librdkafka"

module Kafka
  VERSION = "0.1.0"
end

require "./kafka/config"
require "./kafka/instance"
require "./kafka/consumer"
require "./kafka/producer"
