if [[ ! -f startup-supreme-centos7.sh ]];
then
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/startup-supreme-centos7.sh > startup-supreme-centos7.sh
chmod +x startup-supreme-centos7.sh
fi
gmailEmail=
gmailPassward=
sh startup-supreme-centos7.sh "${gmailEmail}" "${gmailPassward}" >> startup.log
echo -e "\n" >> /etc/rc.d/rc.local
echo "cd ~ && sh startup-supreme-centos7.sh ${gmailEmail} ${gmailPassward} >> startup.log" >> /etc/rc.d/rc.local