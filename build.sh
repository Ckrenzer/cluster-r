#!/usr/bin/bash
git_hash="$(git rev-parse --short HEAD)"
username="ckrenzer"
registry_name="${username}/cluster-r"
registry_password="$(awk '{print $2}' ~/.dockerlogin)"
tag_name="${registry_name}:data.table"
docker build --compress --build-arg GITHASH="${git_hash}" --tag "${tag_name}" .
echo "${registry_password}" | docker login -u "${username}" --password-stdin
docker push "${tag_name}"
docker logout
