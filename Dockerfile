FROM rhub/r-minimal:4.5
ARG GITHASH
LABEL version=${GITHASH}
# assuming the user registers the cluster using doParallel::registerDoParallel,
# all nodes in a cluster spun up by parallelly will require doParallel and
# any other package used by code that runs in parallel
# (Ex. code in the body of a foreach loop).
RUN installr -d -t zlib-dev data.table doParallel
