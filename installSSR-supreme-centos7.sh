#!bin/bash

#install required tools
yum install bc  -y
yum install net-tools -y

#install ssr
if [[ -f kernalReinstalled ]]
then
echo -e "skip install ssr"
else
echo -e "install ssr..."
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/shadowsocks-all.sh > shadowsocks-all.sh

echo -e "4\nweigegenb666\n20265\n13\ny\n2\n" | sh shadowsocks-all.sh
fi

#reinstall kernal
if [[ -f kernalReinstalled ]]
then
echo -e "skip reinstall kernal"
else
echo -e "reinstall kernal..."
rpm -ivh http://soft.91yun.org/ISO/Linux/CentOS/kernel/kernel-3.10.0-229.1.2.el7.x86_64.rpm --force

touch kernalReinstalled
reboot
exit 0
echo "reboot also continue!" > notExit
fi

#install ribu
if [[ -f kernalReinstalled && ! -f 91yunserverspeeder ]]
then
echo -e "install rebu..."
wget -N --no-check-certificate https://github.com/91yun/serverspeeder/raw/master/serverspeeder.sh
sh serverspeeder.sh > serverspeeder.log

echo send email...
email=
for line in `cat emailList` 
do
	if [[ $email ]];
	then
		email="${email},"
	else
		email=""
	fi
    email="${email}${line}"
done
echo "to ${email}"
# ip=`ifconfig | sed -n '/inet addr/s/^[^:]*:\([0-9.]\{7,15\}\) .*/\1/p' | grep -v 127.0.0.1`
ip=`ifconfig | grep -oE '\inet ([0-9]{1,3}\.){3}[0-9]{1,3}\b' | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}\b' | grep -v 127.0.0.1`
des=" [Server: ${ip}] Installation completed!"
echo "${des}" | mail -s "${des}" $email
else
echo -e "skip install ribu"
fi

