#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)

DIR_PATH=${DIR}/ingress-route


kubectl apply -f  ${DIR_PATH}/traefik-rbac-middleware.yaml
kubectl apply -f  ${DIR_PATH}/traefik-deployment.yaml


kubectl get pod

echo -e "\n\n\n"

echo " success"




