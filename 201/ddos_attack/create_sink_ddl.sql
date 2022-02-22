CREATE TABLE  `slowloris_attacks` (
  `alert` CHAR(4) NOT NULL,
  `source_ip` VARCHAR(2147483647),
  `window_start` TIMESTAMP(3) NOT NULL,
  `window_end` TIMESTAMP(3) NOT NULL,
  `count_connection_reset` BIGINT NOT NULL
) WITH (
  'connector' = 'kafka',                    -- Specify what connector to use, for Kafka it must use 'kafka'.
  'format' = 'json',                        -- Data format
  'properties.bootstrap.servers' = 'kafka', -- Comma separated list of Kafka brokers.
  'topic' = 'slowloris'