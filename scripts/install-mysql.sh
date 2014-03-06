#!/bin/bash

if [ -z $MYSQL_PASSWORD ]; then 
    MYSQL_PASSWORD="password"
fi 

# Install without prompting for passwords
echo "mysql-server-5.5 mysql-server/root_password password $MYSQL_PASSWORD" | debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password $MYSQL_PASSWORD" | debconf-set-selections
apt-get -y install mysql-server-5.5

# Allow remote access
sed -i "s/^bind\-address.*/bind-address = 0.0.0.0/g" /etc/mysql/my.cnf
restart mysql

# Grant remote root permissions
mysql -u root --password=${MYSQL_PASSWORD} -h localhost -e "GRANT ALL ON *.* to root@\"localhost\" IDENTIFIED BY \"${MYSQL_PASSWORD}\" WITH GRANT OPTION;"
mysql -u root --password=${MYSQL_PASSWORD} -h localhost -e "GRANT ALL ON *.* to root@\"%\" IDENTIFIED BY \"${MYSQL_PASSWORD}\" WITH GRANT OPTION;"
mysqladmin -uroot -p${MYSQL_PASSWORD} flush-privileges


# default client settings

MYSQL_CLIENT_CNF=/home/vagrant/.my.cnf

if [ ! -f $MYSQL_CLIENT_CNF ]; then

    cat << EOF > $MYSQL_CLIENT_CNF
[client]
host     = 127.0.0.1
port     = 3306
protocol = tcp
user     = root
password = ${MYSQL_PASSWORD}

[mysql]
prompt="\\u@\\h:\\p \\d> "
EOF
    echo "Generated file: $MYSQL_CLIENT_CNF"
fi

chown vagrant:vagrant $MYSQL_CLIENT_CNF

# install eatmydata for mysql dev instances
# to enable, modify /etc/init/mysql.conf:
#  exec /usr/bin/eatmydata /usr/sbin/mysqld
apt-get -y install eatmydata
