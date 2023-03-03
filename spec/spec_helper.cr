require "spec"
require "../src/kafka"

def create_producer
  config = Kafka::Config.new({
    "bootstrap.servers" => "127.0.0.1:9092",
    "security.protocol" => "plaintext",
  })

  Kafka::Producer.new(config)
end