FROM ubuntu
RUN apt update && apt install default-jdk -y
RUN apt install curl -y
RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-*/* /opt/tomcat/.
ADD ./target/*.war /opt/tomcat/webapps/
RUN mv /opt/tomcat/webapps/*.war /opt/tomcat/webapps/myapp.war
EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
