FROM centos
  
RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz
RUN tar xvf apache*.tar.gz
RUN mv apache-tomcat-9.0.71/* /opt/tomcat/.
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
COPY ABC_Technologies/target/ABCtechnologies-1.0.war .

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
