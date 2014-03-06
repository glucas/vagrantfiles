#!/bin/bash

TROVE_INT=$HOME/trove-integration
TROVE_LOCALRC=$TROVE_INT/scripts/localrc.rc

if [ ! -d $TROVE_INT ]; then
    echo "Installing redstack..."
    git clone https://github.com/openstack/trove-integration.git

    # increase backing volume size
    echo "VOLUME_BACKING_FILE_SIZE=15360M" >> $TROVE_LOCALRC

    cd $TROVE_INT/scripts && ./redstack install
    echo "Done installing redstack."
fi
