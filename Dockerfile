FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y default-jdk
RUN apt-get install -y maven
RUN apt-get install -y git
RUN apt-get install -y wget
RUN mkdir /usr/test_tomcat/ && \
        wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.58/bin/apache-tomcat-9.0.58.tar.gz -O /tmp/tomcat.tar.gz &&\
        cd /tmp && tar xvfz tomcat.tar.gz &&\
        cp -Rv /tmp/apache-tomcat-9.0.58/* /usr/test_tomcat/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git &&\
        cd boxfuse-sample-java-war-hello && \
        mvn package &&\
        cd target &&\
        cp hello-1.0.war /usr/test_tomcat/webapps/
EXPOSE 8080
CMD /usr/test_tomcat/bin/catalina.sh run