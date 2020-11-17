#/bin/sh
echo 'SSH URLs:'
index=0
for arg in $*; do
let index=index+1
echo "ss://eGNoYWNoYTIwLWlldGYtcG9seTEzMDU6d2VpZ2VnZW5iNjY2@${arg}:10260/?plugin=simple-obfs;obfs%3Dtls;obfs-host%3Dwww.amazon.com#${index}"
done
