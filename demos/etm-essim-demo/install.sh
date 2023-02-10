#!/usr/bin/env bash

GIT_COMMAND='git'
GIT_DIRECTIVE='clone'
GIT_PARAMS=''

DOCKER_COMMAND='docker'
DOCKER_DIRECTIVE='network create'
DOCKER_PARAMS=''

# Check if Git is in local environment
if ! [ -x "$(command -v $GIT_COMMAND)" ]; then
  echo "ERROR: $GIT_COMMAND was not found!"
  exit
fi

echo "Using $(eval $GIT_COMMAND version)"

# Check if Docker is in local environment
if ! [ -x "$(command -v $DOCKER_COMMAND)" ]; then
  echo "ERROR: $DOCKER_COMMAND was not found!"
  exit
fi

echo "Using docker $(eval $DOCKER_COMMAND version --format '{{.Server.Version}}')"

export $(grep -v '^#' .env.deploy | xargs)

# Retrieve Network Name
DOCKER_PARAMS=$NETWORK_NAME

# Clone Modules
mkdir $INFRA_PATH
cd $INFRA_PATH

$DOCKER_COMMAND $DOCKER_DIRECTIVE $DOCKER_PARAMS


$GIT_COMMAND $GIT_DIRECTIVE https://github.com/MultiModelling/Model-Orchestrator.git
$GIT_COMMAND $GIT_DIRECTIVE https://github.com/MultiModelling/Model-Registry.git

$GIT_COMMAND $GIT_DIRECTIVE https://github.com/MultiModelling/Database-MinIO.git

$GIT_COMMAND $GIT_DIRECTIVE https://github.com/MultiModelling/Adapter-ETM-Price-Profile.git
$GIT_COMMAND $GIT_DIRECTIVE https://github.com/MultiModelling/Adapter-ESDL-Add-Price-Profile.git
$GIT_COMMAND $GIT_DIRECTIVE https://github.com/MultiModelling/Adapter-ESSIM.git