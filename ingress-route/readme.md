
# k8s 安装 IngressRoute【traefik】
官方文档

https://docs.traefik.io/

https://github.com/containous/traefik/

需要高版本的 Kubernetes(k8s) IngressRoute 的 自定义资源类型 才能使用

这里使用的是 k8s v1.16.3 或 更新版本

## 端口

80   ： 直接使用服务器80 端口 提供http 服务

5580 ： traefik UI 界面

443 未开启，未配置，如需开启，请自行配置
## 一键部署
```bash
./create.i.ingress.route.start.sh
```
## 命令部署
```bash
kubectl apply -f  traefik-rbac-middleware.yaml
kubectl apply -f  traefik-deployment.yaml

#以下是案例
kubectl apply -f  demo.yaml
kubectl apply -f  demo-ingress-route.yaml
```

## 查看 demo 返回信息
```bash
curl -x 192.168.0.254:80 http://your.domain.com/notls 
```
返回
```nashorn js
Hostname: whoami-bd6b677dc-gkhmh
IP: 127.0.0.1
IP: 10.244.0.191
RemoteAddr: 10.244.0.190:33406
GET /notls HTTP/1.1
Host: your.domain.com
User-Agent: curl/7.64.1
Accept: */*
Accept-Encoding: gzip
X-Forwarded-For: 10.244.0.1
X-Forwarded-Host: your.domain.com
X-Forwarded-Port: 80
X-Forwarded-Proto: http
X-Forwarded-Server: traefik-74dfb956c5-2zdl2
X-Real-Ip: 10.244.0.1
```
## UI 界面 
浏览器访问
```angular2
http://192.168.0.254:5580
```
如图
![avatar](../doc/images/traefik.png)

## 案例说明
假设 k8s 有后端服务`demo.yaml` `whoami` 且 `POD` 端口为 `80` 那么如何对外绑定 网址路由呢。

在 `demo-ingress-route.yaml` 文件中可以看到详细的配置信息(如下)
```yaml
apiVersion: traefik.containo.us/v1alpha1
kind: IngressRoute
metadata:
  name: simpleingressroute
  namespace: default
spec:
  entryPoints:
    - web
  routes:
    - match: Host(`your.domain.com`) && PathPrefix(`/notls`)
      kind: Rule
      services:
        - name: whoami
          port: 80

---
apiVersion: traefik.containo.us/v1alpha1
kind: IngressRoute
metadata:
  name: ingressroutetls
  namespace: default
spec:
  entryPoints:
    - websecure
  routes:
    - match: Host(`your.domain.com`) && PathPrefix(`/tls`)
      kind: Rule
      services:
        - name: whoami
          port: 80
  tls:
    certResolver: default
```
第一个 `kind: IngressRoute` 路由信息

当域名是`your.domain.com` 

且 后面的 URL 链接是 `/notls` 开头的 走 `whoami` 这个 pod 并且指定端口为 `80` 端口

当然如果 你不需要 URL 开头链接，那么你把 `&& PathPrefix(notls)` 去掉就可以了