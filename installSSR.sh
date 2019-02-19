#!bin/bash

#install ssr
if [[ -f kernalReinstalled ]]
then
echo -e "skip install ssr"
else
echo -e "install ssr..."
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/ssr.sh > ssr.sh
echo -e "1\n1992\nweigegenb666\n10\n1\n1\n\n\n\n" | sh ssr.sh
fi

#reinstall kernal
if [[ -f kernalReinstalled ]]
then
echo -e "skip reinstall kernal"
else
echo -e "reinstall kernal..."
rpm -ivh https://xz.wn789.com/CentOSkernel/kernel-2.6.32-504.3.3.el6.x86_64.rpm --force
touch kernalReinstalled
reboot
fi

#install ribu
if [[ -f kernalReinstalled && !(-f rebuInstalled) ]]
then
echo -e "install rebu..."
wget -N --no-check-certificate https://github.com/91yun/serverspeeder/raw/master/serverspeeder.sh && bash serverspeeder.sh
touch rebuInstalled
else
echo -e "skip install ribu"
fi

