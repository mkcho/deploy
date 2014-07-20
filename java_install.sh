#!/bin/bash
#
# Java Insall
#

##  Install ing Oracle Java 8 via PPA Repository on Debian
## Add repository to the list of sources
#echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
#echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list   

## Import repository key
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886  
## Update local software list
#apt-get update  
## Accept Oracle software license (only required once)
#echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections  
## Install Oracle JDK8
#apt-get install oracle-java8-installer


# Install ing Oracle Java 8 via PPA Repository on Ubuntu
# Delete Openjdk
sudo apt-get purge openjdk* -y

# Install python-software-properties package

sudo apt-get update
sudo apt-get install -y  python-software-properties  

# Add repository to the list of sources
sudo add-apt-repository -y ppa:webupd8team/java  

# Update local software list
sudo apt-get update  

# Accept Oracle software license (only required once)
sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections  

# Install Oracle JDK8
sudo apt-get install -y oracle-java8-installer  

# Check if Oracle Java 8 was installed properly
java -version  
