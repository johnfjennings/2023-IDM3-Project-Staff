#FROM glassfish

#COPY ./IDM3ProjectBasic-1.0-SNAPSHOT.war $GLASSFISH_HOME/glassfish/domains/domain1/autodeploy/


FROM tomcat:9.0
COPY ./IDM3ProjectBasic-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/
#COPY ./mysql-connector-java-8.0.24.jar /usr/local/tomcat/webapps/IDM3ProjectBasic-1.0-SNAPSHOT

#CMD ["catalina.sh", "run"]