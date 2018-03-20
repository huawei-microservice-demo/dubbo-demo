# dubbo-demo

This example shows you how Dubbo Microservices and CSE Microservices work parallely with the help of ServiceComb [Service center](https://github.com/ServiceComb/service-center) and Mesher. In this example we have two dubbo microservices called dubbo-consumer and dubbo-server and CSE consumer microservice. So we make use of Mesher and ServiceComb Service Center to communicate between those services. 

## Quick Start

***Clone or Download the code***

```sh
git clone https://github.com/thandayuthapani/dubbo-demo.git
```
or download the code as ZIP file.

## For Basic use

### Prerequisites
  1. Docker.io
  1. Docker-compose

### Run Locally

You can follow the below steps to run the services in your local VM's and use the ServiceComb [Service center](https://github.com/ServiceComb/service-center) to register the micro-service(Both dubbo microservices and CSE microservies).

***Step 1: Running scripts***

Open scripts directory in dubbo-demo directory which had been cloned or downloaded.
Run *set_up_env.sh* file in the scripts/basic folder.

```sh 
cd scripts/basic
./set_up_env.sh
```
It has all the required jars in lib folder which will just be copied into lib folders of dubbo-provider, dubbo-consumer, cse-comsumer and your project is now ready for running.

***Step 2: Running as a container***

Run the following command to see each service being built as a seperate container and ready to communicate with each other.  It takes 5 to 10 minutes for all the service to be built and to run as a docker container.  Run the following command from scripts/basic directory  to run them.

```sh
docker-compose up
```
***Step 3: Checking for output***

You can actually see the response messages of both dubbo-consumer and cse-consumer without going into the respective container by running the following script file from scripts/basic directory and you can find the logs of those consumers in scripts/basic directory.

```sh
./get_output.sh
```
## Quick start For Development purpose

People who wish to change source code and see changes made in their microservices, can follow the steps given below to generate jars for their code and run them as microservice.

### Prerequisites

  1. Apache Maven 3.3.9
  1. Java 
  1. Docker.io
  1. Docker-compose 

### Run Locally

You can follow the below steps to run the services in your local VM's and use the ServiceComb [Service center](https://github.com/ServiceComb/service-center) to register the micro-service(Both dubbo microservices and CSE microservies).

***Step 1: Running scripts***

Open scripts directory in dubbo-demo directory which had been cloned or downloaded.
Run *generate_jars.sh* file in the scripts folder.

```sh 
cd scripts
./generate_jars.sh
```

It will download all the required maven dependencies for the project and place it in lib folder for dubbo-provider, dubbo-consumer, cse-comsumer and your project is now ready for running.

***Step 2: Running as a container***

Run the following command to see each service being built as a seperate container and ready to communicate with each other.  It takes 5 to 10 minutes for all the service to be built and to run as a docker container.  Run the following command from scripts directory to run them.

```sh
docker-compose up
```

***Step 3: Checking for output***

You can actually see the response messages of both dubbo-consumer and cse-consumer without going into the respective container by running the following script file from scripts directory and you can find the response messages in a scripts directory.

```sh
./get_output.sh
```
