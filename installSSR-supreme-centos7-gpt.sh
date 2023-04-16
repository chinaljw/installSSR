#!bin/bash

function sendEmail() { 
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
}


function openWarp() { 
	echo -e "5" | sh warp.sh menu > open-warp.log
}

if [[ -f install-succeeded ]]
then
	# open warp
	openWarp
	exit 0
else

#install required tools
yum install bc  -y
yum install net-tools -y
yum install wget -y

#reinstall kernal
if [[ -f kernalReinstalled ]]
then
echo -e "skip reinstall kernal"
else
# install kernel-lt.x86_64 (centos7.6 - 5.4)
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
yum --disablerepo="*" --enablerepo="elrepo-kernel" list available -y
yum remove kernel-devel kernel-tools-libs kernel-tools kernel-headers -y
yum --enablerepo=elrepo-kernel install "kernel-lt.x86_64" -y
yum --disablerepo=\* --enablerepo=elrepo-kernel install -y kernel-lt kernel-lt-tools kernel-lt-tools-libs kernel-lt-tools-libs-devel  kernel-lt-headers -y
grub2-set-default 0
grub2-mkconfig -o /etc/grub2.cfg
sudo awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg
touch kernalReinstalled
reboot
exit 0
echo "reboot still continue!" > notExit
fi

#install ssr
if [[ -f kernalReinstalled && ! -f ssrInstalled ]]
then
echo -e "install ssr..."
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/shadowsocks-all.sh > shadowsocks-all.sh
echo -e "4\nweigegenb666\n20265\n13\ny\n2\n" | sh shadowsocks-all.sh > shadowsocks-all.log
touch ssrInstalled
else
echo -e "skip install ssr"
fi

#open bbr
if [[ -f kernalReinstalled && ! -f bbr-opened ]]
then
echo -e "open bbr..."

echo -e "net.core.default_qdisc = fq\nnet.ipv4.tcp_congestion_control = bbr" >> /etc/sysctl.conf
sysctl -p
lsmod | grep bbr > open-bbr.log
touch bbr-opened
else
echo -e "skip open bbr"
fi

#install wareguard
if [[ -f kernalReinstalled && ! -f warp.sh ]]
then
	curl https://raw.githubusercontent.com/chinaljw/installSSR/master/warp.sh > warp.sh
	chmod +x warp.sh
	#open bbr
	openWarp
	sendEmail
	touch install-succeeded
else 
	echo -e "skip install wareguard"
fi

fi
