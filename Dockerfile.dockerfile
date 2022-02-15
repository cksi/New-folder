FROM ubuntu:20.04
RUN apt update
RUN apt install -y nginx
RUN apt install -y default-jdk 
RUN apt install -y maven
RUN apt install -y tomcat9 
RUN apt install -y git 
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git 
RUN cd boxfuse-sample-java-war-hello && mvn package && cp boxfuse-sample-java-war-hello/targer/hello-1.0.war 

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]