# Use an official JBoss Web Server image with Tomcat 11 as the base image.
FROM registry.redhat.io/jboss-eap-7/eap74-openjdk11-openshift-rhel8:latest

ARG DB_HOST=172.30.168.247
ARG DB_NAME=ssoRegisterGuest
ARG DB_USER=admin	
ARG DB_PASSWORD=adminpass

# Set environment variables for the database connection
ENV DATABASE_URL=$DB_HOST
ENV DATABASE_NAME=$DB_NAME
ENV DATABASE_USER=$DB_USER
ENV DATABASE_PASSWORD=$DB_PASSWORD

# Switch to a non-root user
#USER jboss

#Copy your application WAR file to server's deployment directory.
COPY target/GuestUser.war /deployments/

# Expose the default HTTP and HTTPS ports
EXPOSE 8080
EXPOSE 8443



