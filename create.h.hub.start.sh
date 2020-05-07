#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)


mkdir -p        ${DIR}/hub/data
chmod -R 777    ${DIR}/hub/data

kubectl create -f  ${DIR}/hub/hub-service.yml
kubectl create -f  ${DIR}/hub/hub-rc.yml

kubectl create -f  ${DIR}/hub/ui-service.yml
kubectl create -f  ${DIR}/hub/ui-rc.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




