ips=`netstat -na|grep ESTABLISHED| grep -i '10260' | awk '{print $5}'|awk -F: '{print $1}' | sort | uniq`

result="Connected ips:"
for line in $ips
do
response=`curl -s http://ip.taobao.com/service/getIpInfo.php\?ip\=$line`
#    echo $response
city=`echo $response | jq '.data.city'`
isp=`echo $response | jq '.data.isp'`
result=$result"\n$line $city $isp"
done
echo -e $result
