#!/bin/bash

apt-get -y update
apt-get -y dist-upgrade
apt-get -y install build-essential 

# tailor provisioning scripts
export GIT_USER="Greg Lucas"
export GIT_EMAIL="greg@dummy.domain"
export MYSQL_PASSWORD="supersecret"

# install stuff
source /host/provision/install-git.sh
source /host/provision/install-emacs.sh
source /host/provision/install-mysql.sh
source /host/provision/install-java.sh

# configure vagrant user
usermod -a -G admin vagrant
su -c "source /vagrant/init-user-settings.sh" vagrant

# clean up 
apt-get -y autoremove
apt-get -y autoclean
