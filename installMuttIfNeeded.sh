#!bin/bash
if [[ $1 && $2 ]];
then
yum install mutt -y
yum install cyrus-sasl-plain -y

curl https://raw.githubusercontent.com/chinaljw/installSSR/master/Muttrc > Muttrc
curl https://raw.githubusercontent.com/chinaljw/installSSR/master/emailList > emailList
echo "\n" >> Muttrc
echo "set from=$1" >> Muttrc
echo "set smtp_pass=$2" >> Muttrc
name=weigege
if [[ $3 ]];
then
name=$3
fi
echo "set realname=$name" >> Muttrc

cp Muttrc /etc/Muttrc
else 
echo "without email"
fi