#!bin/bash
if [[ $1 && $2 ]];
then

#install mailx
yum install mailx -y

#make config file
mailcfg="
set nss-config-dir=/root/.certs/
\nset ssl-verify=ignore
\nset smtp=smtps://smtp.qq.com:465
\nset smtp-auth=login
\nset smtp-auth-user=${1}
\nset smtp-auth-password=${2}
\nset from=${1}"
echo $mailcfg > /etc/mail.rc

name=weigege
if [[ $3 ]];
then
name=$3
fi
echo "set realname=$name" >> /etc/mail.rc

#make cert
mkdir -p /root/.certs/
echo -n | openssl s_client -connect smtp.qq.com:465 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /root/.certs/qq.crt
certutil -A -n "GeoTrust SSL CA" -t "P,P,P" -d ~/.certs -i /root/.certs/qq.crt
certutil -A -n "GeoTrust Global CA" -t "P,P,P" -d ~/.certs -i /root/.certs/qq.crt
certutil -L -d /root/.certs

else 
echo "not need email"
fi