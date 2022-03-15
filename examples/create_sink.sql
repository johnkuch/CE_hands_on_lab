CREATE TABLE  `output_table` (
  `window_start` TIMESTAMP(3) NOT NULL,
  `window_end` TIMESTAMP(3) NOT NULL,
  `order_status` VARCHAR(2147483647),
  `order_count` BIGINT NOT NULL,
  `total_amount` INT
) WITH (
  'connector' = 'kafka:  Local Kafka', -- Specify what connector to use, for the cluster-local (Docker) Kafka it must be 'kafka:  Local Kafka'.
  'topic' = 'output', -- To read data from when the table is used as source. It also supports topic list for source by separating topic by semicolon. Note, only one of "topic-pattern" and "topic" can be specified for sources. When the table is used as sink, the topic name is the topic to write data to. Note topic list is not supported for sinks.
  'scan.startup.mode' = 'earliest-offset', -- Startup mode for Kafka consumer, valid values are 'earliest-offset', 'latest-offset', 'group-offsets', 'timestamp' and 'specific-offsets'
  'format' = 'json' -- The format used to deserialize and serialize the value part of Kafka messages. Note: Either this option or the 'value.format' option are required.
  -- 'json.map-null-key.mode' = 'FAIL' -- Optional flag to control the handling mode when serializing null key for map data, FAIL by default. Option DROP will drop null key entries for map data. Option LITERAL will use 'map-null-key.literal' as key literal.
  -- 'json.encode.decimal-as-plain-number' = 'false' -- Optional flag to specify whether to encode all decimals as plain numbers instead of possible scientific notations, false by default.
  -- 'json.map-null-key.literal' = 'null' -- Optional flag to specify string literal for null keys when 'map-null-key.mode' is LITERAL, "null" by default.
  -- 'json.fail-on-missing-field' = 'false' -- Optional flag to specify whether to fail if a field is missing or not, false by default.
  -- 'json.ignore-parse-errors' = 'false' -- Optional flag to skip fields and rows with parse errors instead of failing; fields are set to null in case of errors, false by default.
  -- 'json.timestamp-format.standard' = 'SQL' -- Optional flag to specify timestamp format, SQL by default. Option ISO-8601 will parse input timestamp in "yyyy-MM-ddTHH:mm:ss.s{precision}" format and output timestamp in the same format. Option SQL will parse input timestamp in "yyyy-MM-dd HH:mm:ss.s{precision}" format and output timestamp in the same format.
);
