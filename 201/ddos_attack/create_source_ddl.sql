CREATE TABLE `ssb`.`ssb_default`.`ip` (
  `source_ip` VARCHAR(2147483647),
  `dest_port` INT,
  `tcp_flags_ack` INT,
  `tcp_flags_reset` INT,
  `ts` TIMESTAMP(3),
  WATERMARK FOR `ts` AS `ts` - INTERVAL '5' SECOND
) WITH (
  'fields.dest_port.expression' = '#{number.numberBetween ''80'',''9000''}',
  'fields.tcp_flags_reset.expression' = '#{number.numberBetween ''0'',''2''}',
  'fields.ts.expression' = '#{date.past ''15'',''5'',''SECONDS''}',
  'connector' = 'faker',
  'fields.tcp_flags_ack.expression' = '#{number.numberBetween ''0'',''2''}',
  'fields.source_ip.expression' = '#{Internet.ipV4Address}',
  'rows-per-second' = '10'
)