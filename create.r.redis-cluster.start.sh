#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)


mkdir -p        ${DIR}/redis-cluster/data/pv{1..6}
chmod -R 777    ${DIR}/redis-cluster/data

kubectl create -f  ${DIR}/redis-cluster/service.yml
kubectl create -f  ${DIR}/redis-cluster/pod.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




