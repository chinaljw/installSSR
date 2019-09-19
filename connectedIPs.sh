netstat -na|grep ESTABLISHED| grep -i '10160' | awk '{print $5}'|awk -F: '{print $1}' | sort | uniq
