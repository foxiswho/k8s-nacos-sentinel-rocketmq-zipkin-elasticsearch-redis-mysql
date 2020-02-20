#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)
OS_VER="CentOS7"
if grep -Eq "CentOS Linux release 8" /etc/*-release; then
      echo "CentOS Linux release 8";
      cat /etc/redhat-release
      OS_VER="CentOS8"
fi

rm -rf /etc/yum.repos.d/mariadb.repo
if [ "${OS_VER}"x = "CentOS8"x  ]; then

# https://downloads.mariadb.org/mariadb/repositories/#mirror=exascale

cat <<EOF > /etc/yum.repos.d/mariadb.repo
[mariadb]
name = MariaDB
baseurl = http://mirrors.aliyun.com/mariadb/yum/10.4/centos8-amd64/
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
enabled=1
gpgcheck=1
EOF

dnf clean all
dnf makecache
dnf repolist

dnf install -y MariaDB-client

else

cat <<EOF > /etc/yum.repos.d/mariadb.repo
[mariadb]
name = MariaDB
baseurl = http://mirrors.aliyun.com/mariadb/yum/10.4/centos7-amd64/
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
enabled=1
gpgcheck=1
EOF

yum clean all
yum makecache
yum repolist

yum install -y MariaDB-client

fi





docker pull mariadb:10.4

mkdir -p ${DIR}/mariadb/data
mkdir -p ${DIR}/mariadb/mariadb.conf.d
chmod -R 777 ${DIR}/mariadb/data
chmod -R 777 ${DIR}/mariadb/mariadb.conf.d



kubectl create -f  ${DIR}/mariadb/service.yml
kubectl create -f  ${DIR}/mariadb/pod.yml

echo "等待 mariadb pod 容器启动成功"
echo "180 秒等待时间"

kubectl get pod
sleep 10s


kubectl get pod

echo "150 秒等待时间"
sleep 10s

kubectl get pod

echo "140 秒等待时间"
sleep 10s

kubectl get pod

echo "130 秒等待时间"
sleep 10s

echo "120 秒等待时间"
sleep 10s

echo "110 秒等待时间"
sleep 10s


echo "100 秒等待时间"
sleep 10s

echo "90 秒等待时间"
sleep 10s

echo "80 秒等待时间"
sleep 10s

echo "70 秒等待时间"
sleep 10s

echo "60 秒等待时间"
sleep 10s

kubectl get pod

echo "50 秒等待时间"
sleep 10s

echo "40 秒等待时间"
sleep 10s

echo "30 秒等待时间"
sleep 10s

echo "20 秒等待时间"
sleep 10s


echo "10 秒等待时间"
sleep 10s

# 这里的休眠只是让数据库容器 尽快创建成功
sleep 10s

kubectl get pod

echo -e "开始 导入 nacos-mysql.sql 数据"
#echo -e "创建 nacos 用户，密码为 nacos"
echo -e "直接使用 数据库默认用户及密码   root/root"
echo -e "创建 库 nacos "

# 导入数据库SQL
mysql -h127.0.0.1 -uroot -proot mysql < ${DIR}/mariadb/sql/nacos-mysql.sql

echo -e "\nnacos-mysql.sql 数据导入成功 \n\n\n"

echo -e "开始 导入 xxl-job sql.sql 数据"
echo -e "使用系统 用户 root,密码为 root"
echo -e "创建 库 xxl_job "

# 导入数据库SQL
mysql -h127.0.0.1 -uroot -proot mysql < ${DIR}/job-xxl-job/sql/sql.sql

echo -e "\nnacos-mysql.sql 数据导入成功 \n\n\n"

kubectl get pod

echo -e "\n\n\n"

echo "mariadb success"




