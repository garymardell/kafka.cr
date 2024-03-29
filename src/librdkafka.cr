@[Link("rdkafka")]
lib LibRdKafka
  enum KafkaType
    RD_KAFKA_PRODUCER
    RD_KAFKA_CONSUMER
  end

  enum KafkaConfRes
    RD_KAFKA_CONF_UNKNOWN = -2
    RD_KAFKA_CONF_INVALID = -1
    RD_KAFKA_CONF_OK = 0
  end

  enum KafkaRespErr
    RD_KAFKA_RESP_ERR__BEGIN = -200
    RD_KAFKA_RESP_ERR__BAD_MSG = -199
    RD_KAFKA_RESP_ERR__BAD_COMPRESSION = -198
    RD_KAFKA_RESP_ERR__DESTROY = -197
    RD_KAFKA_RESP_ERR__FAIL = -196
    RD_KAFKA_RESP_ERR__TRANSPORT = -195
    RD_KAFKA_RESP_ERR__CRIT_SYS_RESOURCE = -194
    RD_KAFKA_RESP_ERR__RESOLVE = -193
    RD_KAFKA_RESP_ERR__MSG_TIMED_OUT = -192
    RD_KAFKA_RESP_ERR__PARTITION_EOF = -191
    RD_KAFKA_RESP_ERR__UNKNOWN_PARTITION = -190
    RD_KAFKA_RESP_ERR__FS = -189
    RD_KAFKA_RESP_ERR__UNKNOWN_TOPIC = -188
    RD_KAFKA_RESP_ERR__ALL_BROKERS_DOWN = -187
    RD_KAFKA_RESP_ERR__INVALID_ARG = -186
    RD_KAFKA_RESP_ERR__TIMED_OUT = -185
    RD_KAFKA_RESP_ERR__QUEUE_FULL = -184
    RD_KAFKA_RESP_ERR__ISR_INSUFF = -183
    RD_KAFKA_RESP_ERR__NODE_UPDATE = -182
    RD_KAFKA_RESP_ERR__SSL = -181
    RD_KAFKA_RESP_ERR__WAIT_COORD = -180
    RD_KAFKA_RESP_ERR__UNKNOWN_GROUP = -179
    RD_KAFKA_RESP_ERR__IN_PROGRESS = -178
    RD_KAFKA_RESP_ERR__PREV_IN_PROGRESS = -177
    RD_KAFKA_RESP_ERR__EXISTING_SUBSCRIPTION = -176
    RD_KAFKA_RESP_ERR__ASSIGN_PARTITIONS = -175
    RD_KAFKA_RESP_ERR__REVOKE_PARTITIONS = -174
    RD_KAFKA_RESP_ERR__CONFLICT = -173
    RD_KAFKA_RESP_ERR__STATE = -172
    RD_KAFKA_RESP_ERR__UNKNOWN_PROTOCOL = -171
    RD_KAFKA_RESP_ERR__NOT_IMPLEMENTED = -170
    RD_KAFKA_RESP_ERR__AUTHENTICATION = -169
    RD_KAFKA_RESP_ERR__NO_OFFSET = -168
    RD_KAFKA_RESP_ERR__OUTDATED = -167
    RD_KAFKA_RESP_ERR__TIMED_OUT_QUEUE = -166
    RD_KAFKA_RESP_ERR__UNSUPPORTED_FEATURE = -165
    RD_KAFKA_RESP_ERR__WAIT_CACHE = -164
    RD_KAFKA_RESP_ERR__INTR = -163
    RD_KAFKA_RESP_ERR__KEY_SERIALIZATION = -162
    RD_KAFKA_RESP_ERR__VALUE_SERIALIZATION = -161
    RD_KAFKA_RESP_ERR__KEY_DESERIALIZATION = -160
    RD_KAFKA_RESP_ERR__VALUE_DESERIALIZATION = -159
    RD_KAFKA_RESP_ERR__PARTIAL = -158
    RD_KAFKA_RESP_ERR__READ_ONLY = -157
    RD_KAFKA_RESP_ERR__NOENT = -156
    RD_KAFKA_RESP_ERR__UNDERFLOW = -155
    RD_KAFKA_RESP_ERR__INVALID_TYPE = -154
    RD_KAFKA_RESP_ERR__RETRY = -153
    RD_KAFKA_RESP_ERR__PURGE_QUEUE = -152
    RD_KAFKA_RESP_ERR__PURGE_INFLIGHT = -151
    RD_KAFKA_RESP_ERR__FATAL = -150
    RD_KAFKA_RESP_ERR__INCONSISTENT = -149
    RD_KAFKA_RESP_ERR__GAPLESS_GUARANTEE = -148
    RD_KAFKA_RESP_ERR__MAX_POLL_EXCEEDED = -147
    RD_KAFKA_RESP_ERR__UNKNOWN_BROKER = -146
    RD_KAFKA_RESP_ERR__NOT_CONFIGURED = -145
    RD_KAFKA_RESP_ERR__FENCED = -144
    RD_KAFKA_RESP_ERR__APPLICATION = -143
    RD_KAFKA_RESP_ERR__ASSIGNMENT_LOST = -142
    RD_KAFKA_RESP_ERR__NOOP = -141
    RD_KAFKA_RESP_ERR__AUTO_OFFSET_RESET = -140

    RD_KAFKA_RESP_ERR__END = -100
    RD_KAFKA_RESP_ERR_UNKNOWN = -1
    RD_KAFKA_RESP_ERR_NO_ERROR = 0
    RD_KAFKA_RESP_ERR_OFFSET_OUT_OF_RANGE = 1
    RD_KAFKA_RESP_ERR_INVALID_MSG = 2
    RD_KAFKA_RESP_ERR_UNKNOWN_TOPIC_OR_PART = 3
    RD_KAFKA_RESP_ERR_INVALID_MSG_SIZE = 4
    RD_KAFKA_RESP_ERR_LEADER_NOT_AVAILABLE = 5
    RD_KAFKA_RESP_ERR_NOT_LEADER_FOR_PARTITION = 6
    RD_KAFKA_RESP_ERR_REQUEST_TIMED_OUT = 7
    RD_KAFKA_RESP_ERR_BROKER_NOT_AVAILABLE = 8
    RD_KAFKA_RESP_ERR_REPLICA_NOT_AVAILABLE = 9
    RD_KAFKA_RESP_ERR_MSG_SIZE_TOO_LARGE = 10
    RD_KAFKA_RESP_ERR_STALE_CTRL_EPOCH = 11
    RD_KAFKA_RESP_ERR_OFFSET_METADATA_TOO_LARGE = 12
    RD_KAFKA_RESP_ERR_NETWORK_EXCEPTION = 13
    RD_KAFKA_RESP_ERR_COORDINATOR_LOAD_IN_PROGRESS = 14
    RD_KAFKA_RESP_ERR_COORDINATOR_NOT_AVAILABLE = 15
    RD_KAFKA_RESP_ERR_NOT_COORDINATOR = 16
    RD_KAFKA_RESP_ERR_TOPIC_EXCEPTION = 17
    RD_KAFKA_RESP_ERR_RECORD_LIST_TOO_LARGE = 18
    RD_KAFKA_RESP_ERR_NOT_ENOUGH_REPLICAS = 19
    RD_KAFKA_RESP_ERR_NOT_ENOUGH_REPLICAS_AFTER_APPEND = 20
    RD_KAFKA_RESP_ERR_INVALID_REQUIRED_ACKS = 21
    RD_KAFKA_RESP_ERR_ILLEGAL_GENERATION = 22
    RD_KAFKA_RESP_ERR_INCONSISTENT_GROUP_PROTOCOL = 23
    RD_KAFKA_RESP_ERR_INVALID_GROUP_ID = 24
    RD_KAFKA_RESP_ERR_UNKNOWN_MEMBER_ID = 25
    RD_KAFKA_RESP_ERR_INVALID_SESSION_TIMEOUT = 26
    RD_KAFKA_RESP_ERR_REBALANCE_IN_PROGRESS = 27
    RD_KAFKA_RESP_ERR_INVALID_COMMIT_OFFSET_SIZE = 28
    RD_KAFKA_RESP_ERR_TOPIC_AUTHORIZATION_FAILED = 29
    RD_KAFKA_RESP_ERR_GROUP_AUTHORIZATION_FAILED = 30
    RD_KAFKA_RESP_ERR_CLUSTER_AUTHORIZATION_FAILED = 31
    RD_KAFKA_RESP_ERR_INVALID_TIMESTAMP = 32
    RD_KAFKA_RESP_ERR_UNSUPPORTED_SASL_MECHANISM = 33
    RD_KAFKA_RESP_ERR_ILLEGAL_SASL_STATE = 34
    RD_KAFKA_RESP_ERR_UNSUPPORTED_VERSION = 35
    RD_KAFKA_RESP_ERR_TOPIC_ALREADY_EXISTS = 36
    RD_KAFKA_RESP_ERR_INVALID_PARTITIONS = 37
    RD_KAFKA_RESP_ERR_INVALID_REPLICATION_FACTOR = 38
    RD_KAFKA_RESP_ERR_INVALID_REPLICA_ASSIGNMENT = 39
    RD_KAFKA_RESP_ERR_INVALID_CONFIG = 40
    RD_KAFKA_RESP_ERR_NOT_CONTROLLER = 41
    RD_KAFKA_RESP_ERR_INVALID_REQUEST = 42
    RD_KAFKA_RESP_ERR_UNSUPPORTED_FOR_MESSAGE_FORMAT = 43
    RD_KAFKA_RESP_ERR_POLICY_VIOLATION = 44
    RD_KAFKA_RESP_ERR_OUT_OF_ORDER_SEQUENCE_NUMBER = 45
    RD_KAFKA_RESP_ERR_DUPLICATE_SEQUENCE_NUMBER = 46
    RD_KAFKA_RESP_ERR_INVALID_PRODUCER_EPOCH = 47
    RD_KAFKA_RESP_ERR_INVALID_TXN_STATE = 48
    RD_KAFKA_RESP_ERR_INVALID_PRODUCER_ID_MAPPING = 49
    RD_KAFKA_RESP_ERR_INVALID_TRANSACTION_TIMEOUT = 50
    RD_KAFKA_RESP_ERR_CONCURRENT_TRANSACTIONS = 51
    RD_KAFKA_RESP_ERR_TRANSACTION_COORDINATOR_FENCED = 52
    RD_KAFKA_RESP_ERR_TRANSACTIONAL_ID_AUTHORIZATION_FAILED = 53
    RD_KAFKA_RESP_ERR_SECURITY_DISABLED = 54
    RD_KAFKA_RESP_ERR_OPERATION_NOT_ATTEMPTED = 55
    RD_KAFKA_RESP_ERR_KAFKA_STORAGE_ERROR = 56
    RD_KAFKA_RESP_ERR_LOG_DIR_NOT_FOUND = 57
    RD_KAFKA_RESP_ERR_SASL_AUTHENTICATION_FAILED = 58
    RD_KAFKA_RESP_ERR_UNKNOWN_PRODUCER_ID = 59
    RD_KAFKA_RESP_ERR_REASSIGNMENT_IN_PROGRESS = 60
    RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_AUTH_DISABLED = 61
    RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_NOT_FOUND = 62
    RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_OWNER_MISMATCH = 63
    RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_REQUEST_NOT_ALLOWED = 64
    RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_AUTHORIZATION_FAILED = 65
    RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_EXPIRED = 66
    RD_KAFKA_RESP_ERR_INVALID_PRINCIPAL_TYPE = 67
    RD_KAFKA_RESP_ERR_NON_EMPTY_GROUP = 68
    RD_KAFKA_RESP_ERR_GROUP_ID_NOT_FOUND = 69
    RD_KAFKA_RESP_ERR_FETCH_SESSION_ID_NOT_FOUND = 70
    RD_KAFKA_RESP_ERR_INVALID_FETCH_SESSION_EPOCH = 71
    RD_KAFKA_RESP_ERR_LISTENER_NOT_FOUND = 72
    RD_KAFKA_RESP_ERR_TOPIC_DELETION_DISABLED = 73
    RD_KAFKA_RESP_ERR_FENCED_LEADER_EPOCH = 74
    RD_KAFKA_RESP_ERR_UNKNOWN_LEADER_EPOCH = 75
    RD_KAFKA_RESP_ERR_UNSUPPORTED_COMPRESSION_TYPE = 76
    RD_KAFKA_RESP_ERR_STALE_BROKER_EPOCH = 77
    RD_KAFKA_RESP_ERR_OFFSET_NOT_AVAILABLE = 78
    RD_KAFKA_RESP_ERR_MEMBER_ID_REQUIRED = 79
    RD_KAFKA_RESP_ERR_PREFERRED_LEADER_NOT_AVAILABLE = 80
    RD_KAFKA_RESP_ERR_GROUP_MAX_SIZE_REACHED = 81
    RD_KAFKA_RESP_ERR_FENCED_INSTANCE_ID = 82
    RD_KAFKA_RESP_ERR_ELIGIBLE_LEADERS_NOT_AVAILABLE = 83
    RD_KAFKA_RESP_ERR_ELECTION_NOT_NEEDED = 84
    RD_KAFKA_RESP_ERR_NO_REASSIGNMENT_IN_PROGRESS = 85
    RD_KAFKA_RESP_ERR_GROUP_SUBSCRIBED_TO_TOPIC = 86
    RD_KAFKA_RESP_ERR_INVALID_RECORD = 87
    RD_KAFKA_RESP_ERR_UNSTABLE_OFFSET_COMMIT = 88
    RD_KAFKA_RESP_ERR_THROTTLING_QUOTA_EXCEEDED = 89
    RD_KAFKA_RESP_ERR_PRODUCER_FENCED = 90
    RD_KAFKA_RESP_ERR_RESOURCE_NOT_FOUND = 91
    RD_KAFKA_RESP_ERR_DUPLICATE_RESOURCE = 92
    RD_KAFKA_RESP_ERR_UNACCEPTABLE_CREDENTIAL = 93
    RD_KAFKA_RESP_ERR_INCONSISTENT_VOTER_SET = 94
    RD_KAFKA_RESP_ERR_INVALID_UPDATE_VERSION = 95
    RD_KAFKA_RESP_ERR_FEATURE_UPDATE_FAILED = 96
    RD_KAFKA_RESP_ERR_PRINCIPAL_DESERIALIZATION_FAILURE = 97
    RD_KAFKA_RESP_ERR_END_ALL
  end

  enum KafkaVType
    RD_KAFKA_VTYPE_END
    RD_KAFKA_VTYPE_TOPIC
    RD_KAFKA_VTYPE_RKT
    RD_KAFKA_VTYPE_PARTITION
    RD_KAFKA_VTYPE_VALUE
    RD_KAFKA_VTYPE_KEY
    RD_KAFKA_VTYPE_OPAQUE
    RD_KAFKA_VTYPE_MSGFLAGS
    RD_KAFKA_VTYPE_TIMESTAMP
    RD_KAFKA_VTYPE_HEADER
    RD_KAFKA_VTYPE_HEADERS
  end

  enum KafkaTimestampType
    RD_KAFKA_TIMESTAMP_NOT_AVAILABLE
    RD_KAFKA_TIMESTAMP_CREATE_TIME
    RD_KAFKA_TIMESTAMP_LOG_APPEND_TIME
  end

  struct KafkaVuMem
    ptr : Void*
    size : LibC::SizeT
  end

  struct KafkaVuHeader
    name : LibC::Char*
    val : Void*
    size : LibC::SizeT
  end

  union KafkaVuValue
    cstr : LibC::Char*
    rkt : Void* # TODO
    i : LibC::Int
    i32 : LibC::Int32T
    i64 : LibC::Int64T
    mem : KafkaVuMem
    header : KafkaVuHeader
    headers : Void*
    ptr : UInt8*
    pad : StaticArray(LibC::Char, 64)
  end

  struct KafkaVu
    vtype : KafkaVType
    u : KafkaVuValue
  end

  struct KafkaDelivery
    pending : UInt8
    response : LibC::Int
    partition : LibC::Int
    offset : LibC::Int64T
  end

  RD_KAFKA_MSG_F_COPY = 0x2

  type Kafka = Void*
  type KafkaConf = Void*
  type KafkaTopicConf = Void*
  type KafkaTopic = Void*

  struct KafkaMessage
    err : KafkaRespErr
    rkt : KafkaTopic
    partition : LibC::Int32T
    payload : UInt8*
    len : LibC::SizeT
    key : UInt8*
    key_len : LibC::SizeT
    offset : LibC::Int64T
    _private : Void*
  end

  struct KafkaTopicPartition
    topic : LibC::Char*
    partition : Int32
    offset : Int64
    metadata : UInt8*
    metadata_size : LibC::SizeT
    opaque : Void*
    err : KafkaRespErr
    _private : Void*
  end

  struct KafkaTopicPartitionList
    cnt : LibC::Int
    size : LibC::Int
    elems : KafkaTopicPartition*
  end

  fun rd_kafka_conf_new() : KafkaConf
  fun rd_kafka_conf_destroy(conf : KafkaConf)
  fun rd_kafka_conf_set(conf : KafkaConf, name : LibC::Char*, value : LibC::Char*, errstr : LibC::Char*, errstr_size : LibC::SizeT) : KafkaConfRes
  fun rd_kafka_conf_set_dr_msg_cb(conf : KafkaConf, dr_msg_cb : Proc(Kafka, KafkaMessage*, Void*, Nil))
  fun rd_kafka_conf_set_error_cb(conf : KafkaConf, error_cb : (Kafka, LibC::Int, LibC::Char*, Void*) ->)

  fun rd_kafka_new(type : KafkaType, conf : KafkaConf, errstr : LibC::Char*, errstr_size : LibC::SizeT) : Kafka
  fun rd_kafka_destroy(rk : Kafka)

  fun rd_kafka_topic_new(rk : Kafka, topic : LibC::Char*, conf : KafkaTopicConf) : KafkaTopic
  fun rd_kafka_topic_name(rk : KafkaTopic) : LibC::Char*
  fun rd_kafka_topic_destroy(rk : KafkaTopic)
  fun rd_kafka_topic_conf_new() : KafkaTopicConf
  fun rd_kafka_topic_conf_set(conf : KafkaTopicConf, name : LibC::Char*, value : LibC::Char*, errstr : LibC::Char*, errstr_size : LibC::SizeT) : KafkaConfRes

  fun rd_kafka_produce(rkt : KafkaTopic, partition : Int32, msgflags : LibC::Int, payload : Void*, len : LibC::SizeT, key : Void*, keylen : LibC::SizeT, msg_opaque : Void*) : LibC::Int
  fun rd_kafka_producev(rk : Kafka, ...) : KafkaRespErr
  fun rd_kafka_producea(rk : Kafka, vus : KafkaVu*, cnt : LibC::SizeT) : Void*

  fun rd_kafka_poll_set_consumer(rk : Kafka)
  fun rd_kafka_poll(rk : Kafka, timeout_ms : LibC::Int) : LibC::Int
  fun rd_kafka_outq_len(rk : Kafka) : LibC::Int

  fun rd_kafka_topic_partition_list_new(size : LibC::Int) : KafkaTopicPartitionList*
  fun rd_kafka_topic_partition_list_add(rktparlist : KafkaTopicPartitionList*, topic : LibC::Char*, partition : Int32) : KafkaTopicPartition*
  fun rd_kafka_topic_partition_list_destroy(rktparlist : KafkaTopicPartitionList*)

  fun rd_kafka_subscribe(rk : Kafka, topics : KafkaTopicPartitionList*) : KafkaRespErr
  fun rd_kafka_unsubscribe(rk : Kafka) : KafkaRespErr

  fun rd_kafka_consumer_poll(rk : Kafka, timeout_ms : LibC::Int) : KafkaMessage*
  fun rd_kafka_consumer_close(rk : Kafka) : KafkaRespErr
  fun rd_kafka_message_destroy(rkm : KafkaMessage*)
  fun rd_kafka_flush(rk : Kafka, timeout_ms : LibC::Int) : KafkaRespErr

  fun rd_kafka_offset_store(rkt : KafkaTopic, partition : Int32, offset : Int64) : KafkaRespErr
  fun rd_kafka_seek(rkt : KafkaTopic, partition : Int32, offset : Int64, timeout_ms : LibC::Int) : KafkaRespErr

  fun rd_kafka_clusterid(rk : Kafka) : LibC::Char*
  fun rd_kafka_memberid(rk : Kafka) : LibC::Char*

  fun rd_kafka_message_timestamp(rkm : KafkaMessage*, tstype : KafkaTimestampType*) : Int64

  fun rd_kafka_last_error() : KafkaRespErr
  fun rd_kafka_err2str(err : KafkaRespErr) : LibC::Char*

  fun rd_kafka_version : LibC::Int
  fun rd_kafka_version_str : LibC::Char*
end