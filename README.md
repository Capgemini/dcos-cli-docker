[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

# DCOS CLI docker container

A simple Docker image based on [Alpine](https://registry.hub.docker.com/_/alpine/) used by [Apollo](https://github.com/Capgemini/Apollo) for running [Mesosphere DCOS command-line interface (CLI) to remotely manage your mesos cluster](https://docs.mesosphere.com/using/cli/).

## Usage

### Running DCOS CLI

See all available commands:

```bash
docker run -it capgemini:dcos-cli
```

This image provides some values by default for your DCOS CLI config.

```bash
DCOS_CONFIG=/dcos-cli/.dcos/dcos.toml
SOURCES=${SOURCES:-'[ "https://github.com/mesosphere/multiverse/archive/master.zip", "https://github.com/mesosphere/universe/archive/version-1.x.zip",]'}
MESOS_MASTER_URL=${MESOS_MASTER_URL:-'http://127.0.0.1:5050'}
MARATHON_URL=${MARATHON_URL:-'http://127.0.0.1:8080'}
TOKEN=${TOKEN:-'1234'}
EMAIL=${EMAIL:-'apollo@capgemini.com'}
```

You can override any value at run time as follows:

```bash
docker run -v `pwd`/chronos_config:/config \
           -e MESOS_MASTER_URL='http://172.31.1.11:5050' \
           -e MARATHON_URL='http://172.31.1.11:8080' \
           -it capgemini:dcos-cli package install --options=config --yes chronos
```

### Why?

This Docker image allows us to run DCOS CLI commands from any server using automation provisioning tools like Ansible with no necessity to install DCOS at runtime and without adding any dependency to our base images.
