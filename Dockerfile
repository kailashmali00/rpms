FROM centos

MAINTAINER kailashmali00@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-7/v7.0.107/bin/apache-tomcat-7.0.107.tar.gz
RUN tar -xvf apache-tomcat-7.0.107.tar.gz
RUN mv apache-tomcat-7.0.107/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
