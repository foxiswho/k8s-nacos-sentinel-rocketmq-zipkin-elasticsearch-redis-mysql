
https://www.cnblogs.com/centos-python/articles/10886525.html

nodeAffinity 主要解决POD要部署在哪些主机，以及POD不能部署在哪些主机上的问题，处理的是POD和主机之间的关系。

podAffinity 主要解决POD可以和哪些POD部署在同一个拓扑域中的问题（拓扑域用主机标签实现，可以是单个主机，也可以是多个主机组成的cluster、zone等。）

podAntiAffinity主要解决POD不能和哪些POD部署在同一个拓扑域中的问题。它们处理的是Kubernetes集群内部POD和POD之间的关系。