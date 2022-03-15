-- Slowloris attack
INSERT INTO slowloris_attacks
SELECT
    'true' as alert,
    'attack from '||source_ip||':'||CAST(dest_port as varchar) as message,
    source_ip,
    window_start,
    window_end,
    count(*) as count_connection_reset
FROM
    TABLE (
        TUMBLE(TABLE ip, DESCRIPTOR(ts), INTERVAL '10' SECONDS)
    )
WHERE tcp_flags_ack = 1
AND tcp_flags_reset = 1
GROUP BY source_ip, dest_port, window_start, window_end;
