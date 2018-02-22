@echo off & setlocal enabledelayedexpansion
SET CONSUMER_ROOT=%~dp0
set LIB_JARS=""
cd %CONSUMER_ROOT%\..\lib
for %%i in (*) do set LIB_JARS=!LIB_JARS!;..\lib\%%i
cd %CONSUMER_ROOT%\..\bin

if ""%1"" == ""debug"" goto debug
if ""%1"" == ""jmx"" goto jmx

java -Xms64m -Xmx1024m -XX:MaxPermSize=64M -classpath %CONSUMER_ROOT%\..\conf;%LIB_JARS% com.alibaba.dubbo.demo.consumer.Consumer
goto end

:debug
java -Xms64m -Xmx1024m -XX:MaxPermSize=64M -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n -classpath ..\conf;%LIB_JARS% com.alibaba.dubbo.demo.consumer.Consumer
goto end

:jmx
java -Xms64m -Xmx1024m -XX:MaxPermSize=64M -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -classpath ..\conf;%LIB_JARS% com.alibaba.dubbo.demo.consumer.Consumer

:end
