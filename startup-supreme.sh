#!bin/bash
if [[ -f installSSR.sh ]]
then
bash installSSR.sh
else
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installSSR-supreme.sh > installSSR-supreme.sh
bash installSSR-supreme.sh
fi
