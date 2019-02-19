#!bin/bash
if [[ -f installSSR.sh ]]
then
bash installSSR.sh
else
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installSSR.sh?token=AJWK6q25_qKiz55L2AAk6kvGfur-w4Snks5ca9OjwA%3D%3D > installSSR.sh
bash startup.sh
fi
