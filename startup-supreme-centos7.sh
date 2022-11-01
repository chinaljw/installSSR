#!bin/bash
if [[ -f installSSR-supreme-centos7.sh ]]
then
bash installSSR-supreme-centos7.sh >> /root/installSSR-supreme-centos7.log
else
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/connectedIPs.sh > /root/connectedIPs.sh
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installJQ.sh > /root/installJQ.sh
bash installJQ.sh
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installMailXIfNeeded.sh > /root/installMailXIfNeeded.sh
sh installMailXIfNeeded.sh $1 $2 $3
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installHTTPD.sh > /root/installHTTPD.sh
sh installHTTPD.sh
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installSSR-supreme-centos7.sh > /root/installSSR-supreme-centos7.sh
echo "sh /root/startup-supreme-centos7.sh" >> /etc/rc.local
bash installSSR-supreme-centos7.sh >> /root/installSSR-supreme-centos7.log
fi
