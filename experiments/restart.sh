#! /bin/bash

export HERE=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

pushd "$HERE"
docker compose up -d --force-recreate experiments
popd
