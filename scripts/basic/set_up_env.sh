#!/bin/sh

set -e
set -x

HOME=$(cd `dirname $0`; pwd)
mkdir -p $HOME/lib
cd $HOME/../lib
cp -r * $HOME/lib
cd $HOME	
cp -r lib/ ../cse-consumer/
cp -r lib/ ../dubbo-consumer/

net_name=$(ip -o -4 route show to default | awk '{print $5}')
SERVER_HOST=$(ifconfig $net_name | grep -E 'inet\W' | grep -o -E [0-9]+.[0-9]+.[0-9]+.[0-9]+ | head -n 1)

sed -i s/"serveraddress"/"$SERVER_HOST"/ docker-compose.yml

cd $HOME/../
./start_sc.sh
./config_service_center.sh
./copy_mesher.sh
