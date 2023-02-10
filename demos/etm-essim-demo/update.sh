#!/usr/bin/env bash

GIT_COMMAND='git'
GIT_DIRECTIVE='pull origin main'
GIT_PARAMS='--git-dir={}/.git --work-tree=$PWD/{}'

# Check if Git is in local environment
if ! [ -x "$(command -v $GIT_COMMAND)" ]; then
  echo "ERROR: $GIT_COMMAND was not found!"
  exit
fi

echo "Using $(eval $GIT_COMMAND version)"

# Update Modules
export $(grep -v '^#' .env.deploy | xargs)
cd $INFRA_PATH
find . -maxdepth 1 -type d -exec $GIT_COMMAND $GIT_PARAMS $GIT_DIRECTIVE \;