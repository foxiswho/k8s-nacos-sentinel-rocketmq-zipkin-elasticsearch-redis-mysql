# redis-sts 集群

- https://rancher.com/blog/2019/deploying-redis-cluster/



# app 
kubectl get pods -l app=redis-cluster



# 必须条件

必须安装了 `NFS`(假设 NFS服务IP为:192.168.0.254)
然后 设置 如下共享目录
```bash
/data/pv1
/data/pv2
/data/pv3
/data/pv4
/data/pv5
/data/pv6
```
