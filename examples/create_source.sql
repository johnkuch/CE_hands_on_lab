DROP TABLE IF EXISTS orders;
CREATE TABLE  orders (
order_id INTEGER,
city STRING,
street_address STRING,
amount INTEGER,
order_time TIMESTAMP(3),
order_status STRING,
WATERMARK FOR `order_time` AS order_time - INTERVAL '15' SECOND
) WITH (
'connector' = 'faker',
'rows-per-second' = '1',
'fields.order_id.expression' = '#{number.numberBetween ''0'',''99999999''}',
'fields.city.expression' = '#{Address.city}',
'fields.street_address.expression' = '#{Address.street_address}',
'fields.amount.expression' = '#{number.numberBetween ''0'',''100''}',
'fields.order_time.expression' = '#{date.past ''15'',''SECONDS''}',
'fields.order_status.expression' = '#{regexify ''(RECEIVED|PREPARING|DELIVERING|DELIVERED|CANCELED){1}''}'
);
