FROM tomcat:8-jre8 
MAINTAINER "bhargavi"
COPY ./automated-cicd-pipeline/target/automated-cicd-pipeline-1.0.1.war /usr/local/tomcat/webapps
EXPOSE 8080
