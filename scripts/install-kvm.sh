#!/bin/bash
#set -x

if egrep -c '(vmx|svm)' /proc/cpuinfo; then

    apt-get -y install linux-image-extra-virtual
    # reboot required...?
    apt-get -y install qemu-kvm libvirt-bin
    adduser vagrant libvirtd

    apt-get -y install cpu-checker
    kvm-ok

else
    echo "CPU does not support hardware virtualization!"
fi
