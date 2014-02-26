#!/bin/bash

apt-get -y update
apt-get -y dist-upgrade

# tailor provisioning scripts
export GIT_USERNAME="Greg Lucas"
export GIT_EMAIL="greg@dummy.domain"
export MYSQL_PASSWORD="supersecret"

# install stuff
echo "[vagrantfiles] Running install scripts..."
source /host/provision/install-tools.sh
source /host/provision/install-emacs.sh
source /host/provision/install-mysql.sh
source /host/provision/install-java.sh
echo "[vagrantfiles] Done running install scripts."

# configure vagrant user
echo "[vagrantfiles] Configuring vagrant user..."
su -c "source /host/provision/init-vagrant-user.sh" vagrant
echo "[vagrantfiles] Done configuring vagrant user."

# clean up 
apt-get -y autoremove
apt-get -y autoclean
