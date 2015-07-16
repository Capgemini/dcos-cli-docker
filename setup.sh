#!/bin/bash
pushd dcos-cli
curl -O https://downloads.mesosphere.io/dcos-cli/install.sh
bash install.sh . "${MESOS_MASTER_URL}"
popd
