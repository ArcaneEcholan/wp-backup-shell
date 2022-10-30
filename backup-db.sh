#!/bin/bash

# 可变参数
host=127.0.0.1
port=33068
username=root
password=wc123456
dbname=wordpress
# 备份sql文件名
time=$(date "+%Y-%m-%d-%H:%M:%S")
sqlname="wp-db-backup-${time}.sql"


# 开始备份
sh -c "mysqldump -h ${host} -P ${port} -u ${username} --password=${password} ${dbname} > ${sqlname}"