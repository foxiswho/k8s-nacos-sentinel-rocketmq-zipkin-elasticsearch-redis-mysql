#!/usr/bin/env bash



mkdir -p /www/k8s/foxdev/rocketmq/logs-1/
mkdir -p /www/k8s/foxdev/rocketmq/store-1/commitlog
mkdir -p /www/k8s/foxdev/rocketmq/logs-1a/
mkdir -p /www/k8s/foxdev/rocketmq/store-1a/commitlog
mkdir -p /www/k8s/foxdev/rocketmq/logs-1as/
mkdir -p /www/k8s/foxdev/rocketmq/store-1as/commitlog
mkdir -p /www/k8s/foxdev/rocketmq/logs-1as2/
mkdir -p /www/k8s/foxdev/rocketmq/store-1as2/commitlog

mkdir -p /www/k8s/foxdev/rocketmq/logs-2/
mkdir -p /www/k8s/foxdev/rocketmq/store-2/commitlog
mkdir -p /www/k8s/foxdev/rocketmq/logs-2b/
mkdir -p /www/k8s/foxdev/rocketmq/store-2b/commitlog
mkdir -p /www/k8s/foxdev/rocketmq/logs-2bs/
mkdir -p /www/k8s/foxdev/rocketmq/store-2bs/commitlog
mkdir -p /www/k8s/foxdev/rocketmq/logs-2bs2/
mkdir -p /www/k8s/foxdev/rocketmq/store-2bs2/commitlog

chmod -R 777 /www/k8s/foxdev/rocketmq/*

mkdir -p /www/k8s/foxdev/rocketmq/logs-ui/

kubectl create -f  ui-rc.yml
kubectl create -f  ui-service.yml


kubectl create -f  rocketmq1-pod.yml
kubectl create -f  rocketmq1-service.yml

kubectl create -f  rocketmq2-pod.yml
kubectl create -f  rocketmq2-service.yml

echo "create  ui  success"

echo "create  2m-2s-async：多Master多Slave模式，异步复制  success"
echo "create  2m-2s-async：多Master多Slave模式，异步复制  success"
