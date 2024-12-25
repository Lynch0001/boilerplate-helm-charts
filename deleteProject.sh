#!/bin/sh

TARGET_PROJECT=$1
ROOT_PATH="."

if [ $TARGET_PROJECT == "alpha" ]; then
  echo "Cannot delete alpha project values; exiting now"
  exit 0
fi

services=("archiver" "client" "console" "datastore" "deliver" "inbound" "ingester" "oti" "oti-api" "parser" "preparser" "resubmit" "router" "twingate" "twinning")

for service in "${services[@]}"

do
  echo "cleaning $service values"
  BASE_PATH="$service/values/demo"
  rm -rf $ROOT_PATH/$BASE_PATH/$TARGET_PROJECT/
done