#!/usr/bin/env bash


kubectl delete -f  ui-rc.yml
kubectl delete -f  ui-service.yml


kubectl delete -f  rocketmq1-pod.yml
kubectl delete -f  rocketmq1-service.yml

kubectl delete -f  rocketmq2-pod.yml
kubectl delete -f  rocketmq2-service.yml



. rmq.del.sh

kubectl get pod

echo -e "\ndelete success"

