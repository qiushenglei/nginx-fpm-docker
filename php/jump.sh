#!/bin/bash

#核心库
until [ ! -z "$core_mysql_ssh" ]
do
    sshpass -p 'g/4k+ncjFZ/PKo0wC7weZoqwtXHtC3E+' ssh  -o StrictHostKeyChecking=no -p 22 -fNL 62972:mysql-core-for-outer-select.xeknow.com:62972 lipengke@10.104.144.153
    core_mysql_ssh=`echo $(netstat -ln |awk '/^tcp/ {print $4}' | grep 62972)`
done
echo "核心库隧道断开了,已经自动重连!"


#订单库
until [ ! -z "$sub_mysql_ssh" ]
do
    sshpass -p 'g/4k+ncjFZ/PKo0wC7weZoqwtXHtC3E+' ssh  -o StrictHostKeyChecking=no -p 22 -fNL 61125:bj-cdb-iufimrnk.sql.tencentcdb.com:61125 lipengke@10.104.144.153
    sub_mysql_ssh=`echo $(netstat -ln |awk '/^tcp/ {print $4}' | grep 61125)` 
done
echo "次级库隧道断开了,已经自动重连!"

#次级库
until [ ! -z "$sub_mysql_ssh" ]
do
    sshpass -p 'g/4k+ncjFZ/PKo0wC7weZoqwtXHtC3E+' ssh  -o StrictHostKeyChecking=no -p 22 -fNL 62992:mysql-secondary-for-outer-select.xeknow.com:62992 lipengke@10.104.144.153
    sub_mysql_ssh=`echo $(netstat -ln |awk '/^tcp/ {print $4}' | grep 62992)` 
done
echo "次级库隧道断开了,已经自动重连!"

#计费库
until [ ! -z "$bill_mysql_ssh" ]
do
    sshpass -p 'g/4k+ncjFZ/PKo0wC7weZoqwtXHtC3E+' ssh  -o StrictHostKeyChecking=no -p 22 -fNL 61581:mysql-charge-for-outer-select.xeknow.com:61581 lipengke@10.104.144.153
    bill_mysql_ssh=`echo $(netstat -ln |awk '/^tcp/ {print $4}' | grep 61581)`
done
echo "计费库隧道断开了,已经自动重连!"


#大数据门户库
until [ ! -z "$bigdata_mysql_ssh" ]
do
    sshpass -p 'g/4k+ncjFZ/PKo0wC7weZoqwtXHtC3E+' ssh  -o StrictHostKeyChecking=no -p 22 -fNL 61207:sh-cdb-ojdb9hns.sql.tencentcdb.com:61207 lipengke@10.104.144.153
    bigdata_mysql_ssh=`echo $(netstat -ln |awk '/^tcp/ {print $4}' | grep 61207)` # 大数据门户库
done
echo "大数据门户库隧道断开了,已经自动重连!"

#电商平台库
until [ ! -z "$ec_mysql_ssh" ]
do
    sshpass -p 'g/4k+ncjFZ/PKo0wC7weZoqwtXHtC3E+' ssh  -o StrictHostKeyChecking=no -p 22 -fNL 60118:bj-cdb-hxo9dzrc.sql.tencentcdb.com:60118 lipengke@10.104.144.153
    ec_mysql_ssh=`echo $(netstat -ln |awk '/^tcp/ {print $4}' | grep 60118)` 
done
echo "电商平台库隧道断开了,已经自动重连!"


