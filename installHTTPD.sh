#!/bin/bash
yum install httpd -y 
/sbin/iptables -I INPUT -p tcp --dport 1314 -j ACCEPT 
/etc/rc.d/init.d/iptables save 
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/httpd.conf > httpd.conf
cp httpd.conf /etc/httpd/conf/httpd.conf
