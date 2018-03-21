#!/bin/sh

set -e
set -x

HOME=$(cd `dirname $0`; pwd)

cd $HOME
#mvn install:install-file -Dfile=./libs/dubbo-demo-api-2.5.6.jar -DgroupId=com.alibaba -DartifactId=dubbo-demo-api -Dversion=2.5.6 -Dpackaging=jar
#mvn install:install-file -Dfile=libs/dubbo-demo-cseconsumer-2.5.6.jar -DgroupId=com.alibaba -DartifactId=dubbo-demo-api -Dversion=2.5.6 -Dpackaging=jar

mkdir -p /home/root1/.m2/repository/com/alibaba/dubbo-demo-api/2.5.6

mkdir -p /home/root1/.m2/repository/com/alibaba/dubbo-demo-cseconsumer/2.5.6

mkdir -p /home/root1/.m2/repository/com/alibaba/dubbo-demo/2.5.6

cp lib/dubbo-demo-api-2.5.6.jar /home/root1/.m2/repository/com/alibaba/dubbo-demo-api/2.5.6
cp lib/dubbo-demo-cseconsumer-2.5.6.jar /home/root1/.m2/repository/com/alibaba/dubbo-demo-cseconsumer/2.5.6
cp lib/dubbo-demo-2.5.6.pom /home/root1/.m2/repository/com/alibaba/dubbo-demo/2.5.6

cd ../dubbo-demo/dubbo-demo-provider
mvn clean install
mvn dependency:copy-dependencies
cd target/dependency/
pwd
sleep 2
cp -r * $HOME/lib

cd ../../../dubbo-demo-consumer
mvn clean install
mvn dependency:copy-dependencies
cd target/dependency/
pwd
sleep 2
cp -r * $HOME/lib

cd ../../../dubbo-demo-api
mvn clean install
mvn dependency:copy-dependencies
cd target/dependency/
pwd
sleep 2
cp -r * $HOME/lib

cd ../../../dubbo-cse-consumer
mvn clean install
mvn dependency:copy-dependencies
cd target/dependency/
pwd
sleep 2
cp -r * $HOME/lib	


cd $HOME
cp -r lib/ cse-consumer/
cp -r lib/ dubbo-consumer/

./start_sc.sh
./config_env.sh
./copy_mesher.sh
