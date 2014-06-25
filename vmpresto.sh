#This script was written by Theory5
#It is intended to be used for the program virt-install, which is for building Virtual Machines on a headless system
#This script will walk you through creating a virtual disk, specifying an iso, and setting up the preferences for that machine
#Use at your own risk


#!/bin/bash

#ask for name
read -p "Please specify name of system:" SYSN

#check to ensure text is entered
	if [ $SYSN == "" ]; then
    echo "Please enter a name for your VM!"
    else
    

sudo virt-install --connect qemu:///system -n vm10 -r 512 --vcpus=2 --disk path=/var/lib/libvirt/images/vm10.img,size=12 -c /dev/cdrom --vnc --noautoconsole --os-type linux --accelerate --network=bridge:br0 --hvm 
