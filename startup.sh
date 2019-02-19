#!bin/bash
if [[ -f installSSR.sh ]]
then
bash installSSR.sh
else
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installSSR.sh > installSSR.sh
bash installSSR.sh
fi
