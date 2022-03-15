DROP TABLE `slowloris_attacks`;
CREATE TABLE  `slowloris_attacks` (
  `alert` CHAR(4) NOT NULL,
  `message` VARCHAR(2147483647) NULL,
  `source_ip` VARCHAR(2147483647),
  `window_start` TIMESTAMP(3) NOT NULL,
  `window_end` TIMESTAMP(3) NOT NULL,
  `count_connection_reset` BIGINT NOT NULL
) WITH (
  'connector' = 'kafka:  Local Kafka',      -- Specify what connector to use, for Kafka on local Docker it must use 'kafka: Local Kafka'.
  'format' = 'json',                        -- Data format
  'topic' = 'slowloris'
);
