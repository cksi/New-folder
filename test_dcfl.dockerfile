FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y nginx

RUN apt-get install -y default-jdk 
RUN apt-get install -y maven
RUN apt-get install -y tomcat9 
RUN apt-get install -y git 
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /usr/local/nginx/
RUN cd boxfuse-sample-java-war-hello
RUN mvn package
RUN cp boxfuse-sample-java-war-hello/targer/hello-1.0.war /usr/local/tomcat9/wabapps/


EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]