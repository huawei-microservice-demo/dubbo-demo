#!/bin/sh

set -e
set -x


HOME=$(cd `dirname $0`; pwd)

cd $HOME

cp mesher cse-consumer-mesher/

cp mesher dubbo-consumer-mesher/

cp mesher dubbo-provider-mesher/
