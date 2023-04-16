#!bin/bash
cd /root
if [[ -f installSSR-supreme-centos7-gpt.sh ]]
then
bash installSSR-supreme-centos7-gpt.sh >> installSSR-supreme-centos7-gpt.log
else
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/connectedIPs.sh > connectedIPs.sh
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installJQ.sh > installJQ.sh
bash installJQ.sh
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installMailXIfNeeded.sh > installMailXIfNeeded.sh
sh installMailXIfNeeded.sh $1 $2 $3
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installHTTPD.sh > installHTTPD.sh
sh installHTTPD.sh
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installSSR-supreme-centos7-gpt.sh > installSSR-supreme-centos7-gpt.sh
echo "sh /root/startup-supreme-centos7-gpt.sh >> /root/startup-supreme-centos7-gpt.log" >> /etc/rc.d/rc.local
bash installSSR-supreme-centos7-gpt.sh >> installSSR-supreme-centos7-gpt.log
fi
