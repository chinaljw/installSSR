if [[ ! -f startup-supreme.sh ]];
then
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/startup-supreme.sh > startup-supreme.sh
chmod +x startup-supreme.sh
fi
gmailEmail=
gmailPassward=
sh startup-supreme.sh "${gmailEmail}" "${gmailPassward}" >> startup.log
echo -e "\n" >> /etc/rc.d/rc.local
echo "cd ~ && sh startup-supreme.sh ${gmailEmail} ${gmailPassward} >> startup.log" >> /etc/rc.d/rc.local
