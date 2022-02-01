#!/bin/bash
set -e

# Your subscription.
SUBSCRIPTION=xxxxxxxxxxxxxxxxxxxxx
# Your Cluster name
CLUSTER=xxxxxxxxxxxxx
# Your resource group
RESOURCE_GROUP=xxxxxxxxxxxxxxx

exists_image=$(docker images | grep akscmd | wc -l)

if [ $exists_image -eq 0 ]
then
    cd docker
    build.sh
    cd -
fi


docker run -ith aks --rm \
    -v $PWD:/work \
    -v aks_cmd_root:/root \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -w /work \
    -e PATH=/work/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    -e SUBSCRIPTION=$SUBSCRIPTION \
    -e CLUSTER=$CLUSTER \
    -e RESOURCE_GROUP=$RESOURCE_GROUP \
    akscmd:latest /work/bin/init.sh
