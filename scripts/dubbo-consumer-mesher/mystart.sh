#!/bin/sh

set -e
set -x

export CHASSIS_HOME=$(cd `dirname $0`; pwd)

net_name=$(ip -o -4 route show to default | awk '{print $5}')
listen_addr=$(ifconfig $net_name | grep -E 'inet\W' | grep -o -E [0-9]+.[0-9]+.[0-9]+.[0-9]+ | head -n 1)
export SPECIFIC_ADDR=$listen_addr:4444
# replace ip addr
sed -i s/"listenAddress:\s\{1,\}[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}"/"listenAddress: $listen_addr"/g $CHASSIS_HOME/conf/chassis.yaml

#$CHASSIS_HOME/mesher --config $CHASSIS_HOME/conf/mesher.yaml 1>stdout.log 2 >&1  &

cd $CHASSIS_HOME
./mesher 
