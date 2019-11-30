#!bin/bash

#install ssr
if [[ -f kernalReinstalled ]]
then
echo -e "skip install ssr"
else
echo -e "install ssr..."
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/shadowsocks-all.sh > shadowsocks-all.sh
echo -e "4\nweigegenb666\n10260\n13\ny\n2\n" | sh shadowsocks-all.sh
fi

#reinstall kernal
if [[ -f kernalReinstalled ]]
then
echo -e "skip reinstall kernal"
else
echo -e "reinstall kernal..."
rpm -ivh http://xz.wn789.com/CentOSkernel/kernel-2.6.32-504.3.3.el6.x86_64.rpm --force
touch kernalReinstalled
reboot
touch reboot also continue!
fi

#install ribu
if [[ -f kernalReinstalled && !(-f 91yunserverspeeder) ]]
then
echo -e "install rebu..."
wget -N --no-check-certificate https://github.com/91yun/serverspeeder/raw/master/serverspeeder.sh > sh serverspeeder.sh > log
else
echo -e "skip install ribu"
fi

