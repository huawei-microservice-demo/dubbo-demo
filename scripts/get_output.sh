#!/bin/sh

set -e
set -x

sudo docker cp scripts_dubboconsumer_1:/app/logs/stdout.log ./output/dubbo

sudo docker cp scripts_cseconsumer_1:/app/logs/stdout.log ./output/cse
