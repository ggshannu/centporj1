#!/bin/bash
date=$(date +"%F")
a=`find /var/log/ -type f -mtime +90`
b=`find /var/log/ -type d -mtime +90`
cp -pvr $b /tmp/dir/
cat $a > /tmp/old_files
/bin/gzip /tmp/old_files
tar -zcvf /tmp/dir/log_dir.$date.tar.gz *
cd /tmp/dir/
shopt -s extglob
rm -rf !(log_dir.2023-02-16.tar.gz)
#find /tmp/dir/* -type d -exec rm -rf {} \;
if [[ "$? == 0" ]];
then
echo "backup is done"
else
echo "backup is failed"
fi
