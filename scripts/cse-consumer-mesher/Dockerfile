FROM ubuntu:16.04
RUN cd home/
RUN mkdir /app
ADD . /app
RUN apt-get -qq update
RUN apt-get -qq -y install curl
RUN apt-get install -y net-tools
RUN apt-get install -y iproute
#RUN bash app/mystart.sh
ENTRYPOINT ["bash","app/mystart.sh"]
