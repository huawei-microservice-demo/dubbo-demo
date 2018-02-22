#!/bin/bash
cd `dirname $0`
BIN_DIR=`pwd`
# CMDVAR="-Djava.security.egd=file:/dev/./urandom","java -agentlib:jdwp=transport=dt_socket,address=0:8000,server=y,suspend=n -jar"
java $CMDVAR -jar $BIN_DIR/csedemo-1.0.0.jar 1 > stdout.txt 2 >&1 &
