# Use an official JBoss Web Server image with Tomcat 11 as the base image.
FROM registry.redhat.io/jboss-eap-7/eap74-openjdk11-openshift-rhel8:latest

ARG DB_HOST=mysql.guser-sso.svc.cluster.local
ARG DB_NAME=ssoRegisterGuest
ARG DB_USER=admin	
ARG DB_PASSWORD=adminpass

# Set environment variables for the database connection
ENV Database_URL=$DB_HOST
ENV Database_Name=$DB_NAME
ENV Database_User=$DB_USER
ENV Database_Password=$DB_PASSWORD

# Switch to a non-root user
#USER jboss

#Copy your application WAR file to server's deployment directory.
COPY target/GuestUser.war /deployments/

# Expose the default HTTP and HTTPS ports
EXPOSE 8080
EXPOSE 8443



