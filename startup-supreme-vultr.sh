if [[ ! -f startup-supreme.sh ]];
then
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/startup-supreme.sh > startup-supreme.sh
fi
sh startup-supreme.sh {gmailEmail} {gmailPassward} >>> startup.log
