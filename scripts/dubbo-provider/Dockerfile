FROM java:8

RUN mkdir /app
ADD . /app
RUN apt-get update	
RUN apt-get install  net-tools -y
RUN apt-get install  iproute -y
ENTRYPOINT ["bash","app/bin/start.sh"]
