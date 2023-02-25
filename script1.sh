#/bin/bash
echo "##############To zip the /var/log/messages#################################"
d=$(date +"%F")
c=/tmp/mesge
cat /var/log/messages > /tmp/mesge
tar -cvzf  /tmp/mesge-$d.tar.gz $c
if [[ "$?" == 0 ]];
then
cat /dev/null > /var/log/messages
else
echo "message file is not append it is failed"
fi
