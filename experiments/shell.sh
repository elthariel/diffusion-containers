#! /bin/bash

export HERE=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

pushd "$HERE"
docker compose exec experiments bash
popd
