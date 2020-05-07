#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)

echo "kubectl delete "


kubectl delete -f  ${DIR}/hub/hub-service.yml
kubectl delete -f  ${DIR}/hub/hub-rc.yml

kubectl delete -f  ${DIR}/hub/ui-service.yml
kubectl delete -f  ${DIR}/hub/ui-rc.yml

kubectl get pod

echo -e "\n\n\n"

echo "success"




