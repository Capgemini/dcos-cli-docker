#!/bin/bash

SOURCES=${SOURCES:-'[ "https://github.com/mesosphere/multiverse/archive/version-1.x.zip", "https://github.com/mesosphere/universe/archive/version-1.x.zip",]'}
MESOS_MASTER_URL=${MESOS_MASTER_URL:-'http://127.0.0.1:5050'}
MARATHON_URL=${MARATHON_URL:-'http://127.0.0.1:8080'}
TOKEN=${TOKEN:-'1234'}
EMAIL=${EMAIL:-'apollo@capgemini.com'}

cat <<EOF > /dcos-cli/.dcos/dcos.toml
[core]
mesos_master_url = "${MESOS_MASTER_URL}"
token = "${TOKEN}"
dcos_url = "${MESOS_MASTER_URL}"
email = "${EMAIL}"
reporting = true
[marathon]
url = "${MARATHON_URL}"
[package]
sources = ${SOURCES}
cache = "/dcos-cli/.dcos/cache"
EOF
