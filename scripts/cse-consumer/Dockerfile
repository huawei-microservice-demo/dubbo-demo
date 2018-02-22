FROM ubuntu:16.04

RUN mkdir /app
ADD . /app

RUN apt-get update && \

    apt-get upgrade -y && \

    apt-get install -y  software-properties-common && \

    add-apt-repository ppa:webupd8team/java -y && \

    apt-get update && \

    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \

    apt-get install -y oracle-java8-installer && \

    apt-get clean
RUN apt-get install -y net-tools
RUN apt-get install -y iproute
ENTRYPOINT ["bash","app/bin/start.sh"]
