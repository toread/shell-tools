#!/bin/bash
yum install wget -y
yum remove maraidb* -y
wget https://mirrors.tuna.tsinghua.edu.cn/mysql/yum/mysql57-community-el7/mysql-community-client-5.7.30-1.el7.x86_64.rpm -O /tmp/mysql-community-client-5.7.30-1.el7.x86_64.rpm
wget https://mirrors.tuna.tsinghua.edu.cn/mysql/yum/mysql57-community-el7/mysql-community-common-5.7.30-1.el7.x86_64.rpm -O /tmp/mysql-community-common-5.7.30-1.el7.x86_64.rpm
wget https://mirrors.tuna.tsinghua.edu.cn/mysql/yum/mysql57-community-el7/mysql-community-libs-5.7.30-1.el7.x86_64.rpm -O /tmp/mysql-community-libs-5.7.30-1.el7.x86_64.rpm
wget https://mirrors.tuna.tsinghua.edu.cn/mysql/yum/mysql57-community-el7/mysql-community-server-5.7.30-1.el7.x86_64.rpm -O /tmp/mysql-community-server-5.7.30-1.el7.x86_64.rpm

yum localinstall /tmp/mysql-community-common-5.7.30-1.el7.x86_64.rpm -y
yum localinstall /tmp/mysql-community-libs-5.7.30-1.el7.x86_64.rpm -y
yum localinstall /tmp/mysql-community-client-5.7.30-1.el7.x86_64.rpm -y
yum localinstall /tmp/mysql-community-server-5.7.30-1.el7.x86_64.rpm -y
systemctl enable mysqld
systemctl start mysqld
grep "temporary password" /var/log/mysqld.log
/usr/bin/mysql_secure_installation