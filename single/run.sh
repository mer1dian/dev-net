#!/bin/bash -u

NO_LOCK_REQUIRED=true

. ./.env
. ./.common.sh

# Change Scaling from 1 if you are running a HA/Cluster 
DEFAULT_SCALING=1
scaleNode=$DEFAULT_SCALING
composeFile=""

PARAMS=""

displayUsage()
{
  echo "${bold}*************************"
  echo "Freight Trust"
  echo "*************************${normal}"
  echo "DevNet Script"
  echo "12.11.19"
  echo "Usage: ${me} [OPTIONS]"
  echo "    -s or --scale-nodes <NUMBER>            : the quantity of regular node
                                              on your network, default is ${DEFAULTs you want to run_SCALING}"
  echo "    -m or --mode <OPTION>                   : <BOOT>, <AUTH>, <VOTING>, do not adjust unless you know
                                                        what you are doing"
  exit 0
}

# Build and run containers and join network
echo "${composeFile}" > ${LOCK_FILE}

docker-compose ${composeFile} up -d --scale node=${scaleNode}
