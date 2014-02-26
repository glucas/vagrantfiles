#!/bin/bash

# install pycharm

if [ ! -d /opt/pycharm ]; then

    if [ -z "$PYCHARM_DIST" ]; then
	PYCHARM_DIST=`find /host/shared -name pycharm-*.tar.gz`
    fi

    if [ -f $PYCHARM_DIST ]; then
	echo "[vagrantfiles] Installing pycharm from: $PYCHARM_DIST"
	tar xfz $PYCHARM_DIST -C /opt/
	PYCHARM_HOME=$(find /opt -maxdepth 1 -type d -name 'pycharm*')
	chown -R root: $PYCHARM_HOME
	ln -sf $PYCHARM_HOME/bin/pycharm.sh /usr/local/bin/pycharm
	echo "Pycharm installed."
    fi

# add user launch script: 

LAUNCH_PYCHARM=/home/vagrant/bin/launch_pycharm

rm -rf $LAUNCH_PYCHARM
mkdir -p $( dirname $LAUNCH_PYCHARM )
cat << "EOF" > $LAUNCH_PYCHARM
#!/bin/bash
OUTFILE=`mktemp --tmpdir pycharm_XXXXXX.out`
nohup pycharm &> $OUTFILE &
EOF
    chmod a+x $LAUNCH_PYCHARM
    chown -R vagrant:vagrant `dirname $LAUNCH_PYCHARM`
    echo "[vagrantfiles] Generated file: $LAUNCH_PYCHARM"
fi

