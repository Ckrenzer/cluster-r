#!/usr/bin/bash
git_hash="$(git rev-parse --short HEAD)"
registry_name="ckrenzer/cluster-r"
docker build --build-arg GITHASH="${git_hash}" --tag "${registry_name}":data.table .
docker push "${registry_name}":data.table
