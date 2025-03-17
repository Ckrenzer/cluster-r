#!/usr/bin/bash
git_hash="$(git rev-parse --short HEAD)"
username="ckrenzer"
registry_name="${username}/cluster-r"
registry_password="$(awk '{print $2}' ~/.dockerlogin)"
docker build --build-arg GITHASH="${git_hash}" --tag "${registry_name}":data.table .
echo "${registry_password}" | docker login -u "${username}" --password-stdin
docker push "${registry_name}":data.table
docker logout
