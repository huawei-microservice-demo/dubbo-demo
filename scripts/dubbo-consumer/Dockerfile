FROM java:8

RUN mkdir /app
ADD . /app

RUN apt-get update

RUN apt-get install -y net-tools	
RUN apt-get install -y iproute
ENTRYPOINT ["bash","app/bin/start.sh"]
