ips=`netstat -na|grep ESTABLISHED| grep -i '10160' | awk '{print $5}'|awk -F: '{print $1}' | sort | uniq`
#ips=`echo "1.202.165.174\n110.81.87.92\n117.186.29.186\n119.123.47.47"`

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
