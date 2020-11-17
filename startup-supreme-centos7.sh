#!bin/bash
if [[ -f installSSR-supreme-centos7.sh ]]
then
bash installSSR-supreme.sh
else
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/connectedIPs.sh > connectedIPs.sh
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installJQ.sh > installJQ.sh
bash installJQ.sh
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installMuttIfNeeded.sh > installMuttIfNeeded.sh
sh installMuttIfNeeded.sh $1 $2 $3
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installHTTPD.sh > installHTTPD.sh
sh installHTTPD.sh
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installSSR-supreme.sh > installSSR-supreme.sh
bash installSSR-supreme.sh
fi
