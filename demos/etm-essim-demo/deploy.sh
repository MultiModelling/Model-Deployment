#!/usr/bin/env bash

DOCKER_COMMAND='docker compose'
DOCKER_DIRECTIVE='up'
DOCKER_PARAMS='--build --detach'

# Check if Docker is in local environment
if ! [ -x "$(command -v docker)" ]; then
  echo "ERROR: Docker was not found!"
  exit
fi

echo "Using docker $(eval $DOCKER_COMMAND version)"

export $(grep -v '^#' .env.deploy | xargs)
cd $INFRA_PATH

for d in ./Model-*/ ; do (cd "$d" && $DOCKER_COMMAND $DOCKER_DIRECTIVE $DOCKER_PARAMS); done
for d in ./Database-*/ ; do (cd "$d" && $DOCKER_COMMAND $DOCKER_DIRECTIVE $DOCKER_PARAMS); done
for d in ./Adapter-*/ ; do (cd "$d" && $DOCKER_COMMAND $DOCKER_DIRECTIVE $DOCKER_PARAMS); done