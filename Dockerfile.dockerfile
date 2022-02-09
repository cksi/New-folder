FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y nginx

RUN apt-get install -y default-jdk 
RUN apt-get install -y tomcat9 
RUN apt-get install -y git 
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /usr/local/nginx/


EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]