#!/bin/bash

apt-get -y install openjdk-7-jre 
apt-get -y install openjdk-7-jdk 
apt-get -y install openjdk-7-source

update-java-alternatives -s java-1.7.0-openjdk-amd64 &> /dev/null

JAVA_HOME=$( dirname $( dirname $( readlink -e $(which javac) ) ) )
su -c "echo \"JAVA_HOME DEFAULT=$JAVA_HOME\" >> /home/vagrant/.pam_environment" vagrant
echo "[vagrantfiles] Updated file: /home/vagrant/.pam_environment"
