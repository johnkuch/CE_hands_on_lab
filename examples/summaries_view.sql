DROP VIEW IF EXISTS summaries;
CREATE VIEW summaries AS
SELECT window_start, window_end, order_status, COUNT(*) as order_count, SUM(amount) as total_amount
FROM TABLE(
TUMBLE(TABLE orders, DESCRIPTOR(order_time), INTERVAL '20' SECONDS))
GROUP BY window_start, window_end, order_status;
