# Pull base image
FROM ubuntu:18.04

LABEL maintainer="Sergiy Slobodyanyk <nedved198725@gmail.com>"
USER root

# Update and upgrade all packages
RUN \
apt-get update -y
#apt-get -y upgrade

# Install main packages
RUN apt-get install -y openjdk-8-jdk \
openjdk-8-jre \
maven \
git \
xvfb \ 
libappindicator1 \
fonts-liberation
 
# Install Google Chrome v. 79.0.3945.88
RUN \
wget https://www.slimjet.com/chrome/download-chrome.php?file=files/79.0.3945.88/google-chrome-stable_current_amd64.deb -O chrome-stable_current_amd64.deb \
dpkg -i chrome-stable_current_amd64.deb

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV JAVA_VERSION=8u232
ENV JAVA_DEBIAN_VERSION=8u232-b09-1~deb9u1-b09
ENV CA_CERTIFICATES_JAVA_VERSION=20190931+nmu1
ENV GIT_HOME=/usr/bin/git
ENV MAVEN_HOME=/usr/share/maven
ENV XVFB=/usr/bin
ENV GOOGLE-CHROME=/usr/bin/google-chrome

# Define volume directory
#VOLUME ["/var/jenkins_home"] 

# Define working directory
#WORKDIR /var/jenkins_home

#EXPOSE 8080 50000 
USER root