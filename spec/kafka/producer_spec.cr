require "../spec_helper.cr"

describe Kafka::Producer do
  describe "delivery handles" do
    it "can wait for callback to be fired" do
      producer = create_producer

      handle = producer.produce("events", "test event")
      handle.wait # Wait on callback to be fired

      Kafka::DeliveryHandle.registry.should be_empty

      handle.pending?.should be_false
    end
  end
end