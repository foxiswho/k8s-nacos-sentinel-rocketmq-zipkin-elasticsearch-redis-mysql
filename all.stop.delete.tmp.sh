#!/usr/bin/env bash
DIR=$(cd $(dirname $0); pwd)

echo "k8s   一键快速 部署"
echo " "
echo " "
echo "k8s   一键快速 部署 开发环境 By fox"
echo " "
echo " "
echo " "
echo " "
echo " "
echo -e "\033[31m下面将执行删除操作，你确认要删除 ？\033[0m"
echo -e "\033[31m下面将执行删除操作，你确认要删除 ？\033[0m"
echo -e "\033[31m下面将执行删除操作，你确认要删除 ？\033[0m"
echo -e "\033[31m下面将执行删除操作，你确认要删除 ？\033[0m"
echo -e "\033[31m下面将执行删除操作，你确认要删除 ？\033[0m"
echo -e "\033[31m下面将执行删除操作，你确认要删除 ？\033[0m"

echo -e "\033[31m 删除 所有容器生成的本地文件 \033[0m"

get_char()
	{
	SAVEDSTTY=`stty -g`
	stty -echo
	stty cbreak
	dd if=/dev/tty bs=1 count=1 2> /dev/null
	stty -raw
	stty echo
	stty $SAVEDSTTY
	}
echo "任意键继续，如果不需要继续执行删除操作，那么请 关闭终端"
char=`get_char`;



echo -e "删除条件：\033[31m all \033[0m"
echo ""
echo "all：表示全部删除，确认执行删除"

#stty erase ^h
stty erase ^?
read -p "请输入删除条件: " INPUT
if [ x$INPUT == x"all" ]; then
    echo "开始执行删除"
    echo "开始执行删除"

rm -rf ${DIR}/mariadb/data/*
rm -rf ${DIR}/elasticsearch/data/*
rm -rf ${DIR}/elasticsearch/logs/*
rm -rf ${DIR}/nacos/logs-nacos/*
rm -rf ${DIR}/redis/data/*
rm -rf ${DIR}/redis/data/*

rm -rf ${DIR}/rocketmq/logs/*
rm -rf ${DIR}/rocketmq/logs-b/*
rm -rf ${DIR}/rocketmq/logs-b-s/*
rm -rf ${DIR}/rocketmq/logs-ui/*

rm -rf ${DIR}/rocketmq/store/*
rm -rf ${DIR}/rocketmq/store-b/*
rm -rf ${DIR}/rocketmq/store-b-s/*


echo "删除完成"
echo "删除完成"
echo "删除完成"
echo "删除完成"

else
    echo "终止删除"
    exit
fi