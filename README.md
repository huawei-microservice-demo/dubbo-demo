# dubbo-demo

This example shows you how Dubbo Microservices and CSE Microservices work parallely with the help of CSE [Service center](https://github.com/ServiceComb/service-center) and Mesher. In this example we have two dubbo microservices called dubbo-consumer and dubbo-server and CSE consumer microservice. So we make use of Mesher and CSE Service Center to communicate between those services. 

## Get Started
### Prerequisites

  1. Apache Maven 3.3.9
  1. Java 
  1. Docker CE
  1. Docker-compose 

### Run Locally

You can follow the below steps to run the services in your local VM's and use the CSE [Service center](https://github.com/ServiceComb/service-center) to register the micro-service(Both dubbo microservices and CSE microservies).

***Step 1: Clone or Download the code the code***

```sh
git clone https://github.com/thandayuthapani/dubbo-demo.git
```
or download the code as ZIP file.

***Step 2: Start the service center***

You can download CSE [Service center](https://github.com/apache/incubator-servicecomb-service-center/releases) from this link. Go to this link and download the latest release  **service-center-{version}-linux-amd64.tar.gz** in to your local machine. Untar the file using following command

```sh
tar xvzf service-center-{version}-linux-amd64.tar.gz
```
After untaring service-center, open config file in conf/ directory in service-center directory.  Open app.conf and change **httpaddr** to your local machine IP(not 127.0.0.1).  Save the file and run start.sh file.

```sh 
vim conf/app.conf
./start.sh
```

Check whether service-center is running using the following command 

```sh
netstat -lntp | grep 30100
netstat -lntp | grep 2380
```

If running, continue with next step.

***Step 3: Running scripts***

Open scripts directory in dubbo-demo directory which had been cloned or downloaded.
Run *generate_jars.sh* file in the scripts folder.

```sh 
cd scripts
./generate_jars.sh
```

It will download all the required maven dependencies for the project and place it in lib folder for dubbo-provider, dubbo-consumer, cse-comsumer and your project is now ready for running.

***Step 4: Running as a container***

Run the following command to see each service being built as a seperate container and ready to communicate with each other.  It takes 5 to 10 minutes for all the service to be built and to run as a docker container.  Run the following command from scripts directory of project directory to run them.

```sh
sudo docker-compose up
```

***Step 5: Checking for output***

You can actually see the response messages of both dubbo-consumer and cse-consumer without going into the respective container by running the following command and you can find the response messages in a output directory.

```sh
./get_output.sh
```
