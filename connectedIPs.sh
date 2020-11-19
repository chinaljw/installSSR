ips=`netstat -na|grep ESTABLISHED| grep -i '10260' | awk '{print $5}'|awk -F: '{print $1}' | sort | uniq`

echo -e "Connected ips:"
for line in $ips
do
response=`curl -s http://whois.pconline.com.cn/ipJson.jsp\?json\=true\&ip\==$line | iconv -f gbk -t utf8`
#    echo $response
# city=`echo $response | jq '.pro'`
addr=`echo $response | jq '.addr'`
echo -e "$line $addr"
done
