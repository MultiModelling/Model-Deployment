#!/usr/bin/env bash

GIT_COMMAND='git'
GIT_DIRECTIVE=''
GIT_PARAMS='--git-dir={}/.git --work-tree=$PWD/{}'

# Check if Git is in local environment
if ! [ -x "$(command -v $GIT_COMMAND)" ]; then
  echo "ERROR: $GIT_COMMAND was not found!"
  exit
fi

echo "Using $(eval $GIT_COMMAND version)"

# Reset Modules
export $(grep -v '^#' .env.deploy | xargs)
cd $INFRA_PATH

find . -type d -depth 1 -exec $GIT_COMMAND $GIT_PARAMS fetch origin \;
find . -type d -depth 1 -exec $GIT_COMMAND $GIT_PARAMS reset --hard origin/main \;