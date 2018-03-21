#!/usr/bin/env bash
cd ..
# Killing etcd and service-center if running already
kill -9 $(ps aux | grep etcd | grep -v 'grep' | awk '{print $2}')
kill -9 $(ps aux | grep service-center | grep -v 'grep' | awk '{print $2}')
rm -rf apache
mkdir apache
cd apache
# Download Service-center release
wget --no-check-certificate https://github.com/apache/incubator-servicecomb-service-center/releases/download/0.5.0/service-center-0.5.0-linux-amd64.tar.gz
tar -xvf service-center-0.5.0-linux-amd64.tar.gz
rm -rf service-center-0.5.0-linux-amd64.tar.gz
cd service-center-0.5.0-linux-amd64
net_name=$(ip -o -4 route show to default | awk '{print $5}')
SERVER_HOST=$(ifconfig $net_name | grep -E 'inet\W' | grep -o -E [0-9]+.[0-9]+.[0-9]+.[0-9]+ | head -n 1)
# Replacing httpaddr with machine's IP
sed -i s/"httpaddr = 127.0.0.1"/"httpaddr = $SERVER_HOST"/ conf/app.conf
# Starting service-center
bash -x start.sh
