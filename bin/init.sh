#!/bin/bash

if [ ! -d /root/.kube ]
then
    az login --use-device-code
    az account set --subscription $SUBSCRIPTION
    az aks get-credentials -n $CLUSTER -g $RESOURCE_GROUP
fi

fish
