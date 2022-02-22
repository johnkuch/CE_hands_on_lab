# Slowloris DDoS attack 

This stream processor detects potential DDoS attacks and upon detection sends events to a kafka sink. Specifically, it's checking for [Slowloris](https://en.wikipedia.org/wiki/Slowloris_(computer_security)) attacks by looking for patterns that expliot webservers capabilitiy to handle slow connections. When found, it creates a simple message for downstream processing, perhaps an alerting framework, or other.
