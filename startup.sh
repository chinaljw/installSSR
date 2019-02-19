#!bin/bash
if [[ -f installSSR.sh ]]
then
bash installSSR.sh
else
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/installSSR.sh?token=AJWK6jrZc5Uvu4j8Oxy84cgnuNelZxn4ks5ca9DswA%3D%3D > installSSR.sh
bash startup.sh
fi
