#!/bin/bash

# Run CE via docker compose
# https://www.docker.com/products/docker-desktop

mkdir ssb && cd ssb

# get the docker compose file and click through license
# https://www.cloudera.com/downloads/cdf/csa-community-edition.html

# set minimum memory and cpu settings
# https://docs.cloudera.com/csa-ce/1.6.0/support-matrix/topics/csa-ce-system-prereq.html

docker-compose up --scale flink-taskmanager=2

# now point browser to localhost:8000, username: admin pwd:admin

# start writing SQL based stream processors
# https://docs.cloudera.com/csa-ce/1.6.0/getting-started/topics/csa-ce-quickstart-guide.html
