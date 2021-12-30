#!/usr/bin/env bash

set -x

export LOCATION=germanywestcentral

export RESOURCE_GROUP=AZURE-AKS
export CLUSTER_NAME=AKS-CLUSTER

set +x
echo "################################################################################"
echo "### Location Frankfurt"
echo "################################################################################"
set -x

az group create \
    --name ${RESOURCE_GROUP} \
    --location ${LOCATION}

sleep 20

time az aks create \
    --resource-group ${RESOURCE_GROUP} \
    --name ${CLUSTER_NAME} \
    --node-count 3

sleep 60

az group list \
    --query [].name \
    --output table

sleep 20

az resource list \
    --location ${LOCATION} \
    --query [].name \
    --output table

sleep 20

az aks get-credentials \
    --resource-group ${RESOURCE_GROUP} \
    --name ${CLUSTER_NAME} \
    --overwrite-existing

sleep 60

set +x
echo "################################################################################"
echo "### get nodes and pods"
echo "################################################################################"
set -x

kubectl get nodes

kubectl get deployments --all-namespaces

kubectl get pods --all-namespaces

sleep 20

az aks delete \
    --resource-group ${RESOURCE_GROUP} \
    --name ${CLUSTER_NAME} \
    --yes

sleep 20

az group delete \
    --name ${RESOURCE_GROUP} \
    --no-wait \
    --yes

sleep 20