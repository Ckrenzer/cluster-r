git_hash="$(git rev-parse --short HEAD)"
docker build --build-arg GITHASH="$git_hash" --tag ckrenzer/cluster-r:data.table .
