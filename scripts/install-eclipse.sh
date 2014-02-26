#!/bin/bash

# install maven:

apt-get -y install maven

M2_HOME=$( dirname $( dirname $( readlink -e $(which mvn) ) ) )
su -c "echo \"M2_HOME DEFAULT=$M2_HOME\" >> /home/vagrant/.pam_environment" vagrant
echo "[vagrantfiles] Updated file: /home/vagrant/.pam_environment"

# install eclipse

if [ ! -d /opt/eclipse ]; then
    if [ -z "$ECLIPSE_DIST" ]; then
	ECLIPSE_DIST=`find /host/shared -name eclipse-*.tar.gz`
    fi

    if [ -f $ECLIPSE_DIST ]; then
	echo "[vagrantfiles] Installing eclipse from: $ECLIPSE_DIST"
	tar xfz $ECLIPSE_DIST -C /opt/
	chown -R root: /opt/eclipse
	ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse

	# install m2e plugin
	/usr/local/bin/eclipse -application org.eclipse.equinox.p2.director -noSplash \
	    -repository http://download.eclipse.org/releases/kepler \
	    -installIUs org.eclipse.m2e.feature.feature.group

	echo "Eclipse installed."
    fi

fi

# add user launch script: 

LAUNCH_ECLIPSE=/home/vagrant/bin/launch_eclipse

rm -f $LAUNCH_ECLIPSE
mkdir -p $( dirname $LAUNCH_ECLIPSE )
cat << "EOF" > $LAUNCH_ECLIPSE
#!/bin/bash
OUTFILE=`mktemp --tmpdir eclipse_XXXXXX.out`
nohup eclipse &> $OUTFILE &
EOF
chmod a+x $LAUNCH_ECLIPSE
chown -R vagrant:vagrant `dirname $LAUNCH_ECLIPSE`
echo "[vagrantfiles] Generated file: $LAUNCH_ECLIPSE"
