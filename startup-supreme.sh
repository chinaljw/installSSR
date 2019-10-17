#!bin/bash
if [[ -f installSSR-supreme.sh ]]
then
bash installSSR-supreme.sh
else
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/connectedIPs.sh > connectedIPs.sh
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installJQ.sh > installJQ.sh
bash installJQ.sh
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installSSR-supreme.sh > installSSR-supreme.sh
bash installSSR-supreme.sh
fi
