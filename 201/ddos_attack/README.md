# Slowloris DDoS attack 

This stream processor detects potential DDoS attacks and upon detection sends events to a kafka sink. Specifically, it's checking for [Slowloris](https://en.wikipedia.org/wiki/Slowloris_(computer_security)) attacks by looking for patterns that expliot webservers capabilitiy to handle slow connections. When found, it creates a simple message for downstream processing, perhaps an alerting framework, or other.

Running the lab:

1) [Create the source](./create_source_ddl.sql)
2) [Create the sink](./create_sink_ddl.sql)
3) [Run the stream processor](./slowloris_attack_check_job.sql)
