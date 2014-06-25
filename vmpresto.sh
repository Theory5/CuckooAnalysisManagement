#This script was written by Theory5
#It is intended to be used for the program virt-install, which is for building Virtual Machines on a headless system
#This script will walk you through creating a virtual disk, specifying an iso, and setting up the preferences for that machine
#Use at your own risk


#!/bin/bash


#COmmand for Dev purposes
#sudo virt-install --connect qemu:///system -n vm10 -r 512 --vcpus=2 --disk path=/var/lib/libvirt/images/vm10.img,size=12 -c /dev/cdrom --vnc --noautoconsole --os-type linux --accelerate --network=bridge:br0 --hvm 

#until loop to ensure all variables have values entered


#ask for name
read -p "Please specify name of VM being created:" VAR1
until [ -n "${VAR1}" ]; do read -p "Please enter a name:" VAR1; done

read -p "Please specify the amount of RAM you wish to allocate to your VM (In MB's):" VAR2
until [ -n "${VAR2}" ]; do read -p "Please enter a number:" VAR2; done


sudo virt-install --connect qemu:///system -n ${VAR1} -r ${VAR2} --vcpus=2 --disk path=/var/lib/libvirt/images/vm10.img,size=12 -c /dev/cdrom --vnc --noautoconsole --os-type linux --accelerate --network=bridge:br0 --hvm 
