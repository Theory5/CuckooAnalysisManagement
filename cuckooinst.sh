#This is a cuckoo installation bash script, designed to make my life easier by automating a large portion of the cuckoo install
#This install script Is to be used on ubuntu server 12.04.4, has not been tested on a 14.04 install. 
#more information can be found in teh cuckoo change log. 
#built by Theory5 on 5/9/14
#Use as you please, just give credit to the cuckoo guys and myself. (Cuckoo gets top billing, obviously).
#This install assumes that you only have a bare ubuntu or debian install

apt-get -y update
apt-get -y dist-upgrade

apt-get -y install libpcap0.8 libpcap0.8-dev libpcap-dev autogen gcc make libxml2-dev libgnutls-dev libcurl4-gnutls-dev python-dev libnl-dev build-essential autopoint xsltproc w3c-dtd-xhtml python-dev libxen-dev uuid-dev libdevmapper-dev python-dev libcurl4-gnutls-dev libnl-dev libgnutls-dev libpciaccess-dev libxml2-dev pm-utils ebtables

#install git, separated for easier reading

apt-get -y install git git-core

#install libvirt, KVM, and other packages necessary for KVM usage

apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils

#install libvirt and dependencies

apt-get build-dep libvirt-bin libvirt-dev

apt-get install libvirt-bin libvirt-dev

#cd to main dir and create working folder

cd

mkdir cuckooinst

cd cuckooinst

#clone cuckoo
git clone --recursive https://github.com/cuckoobox/cuckoo.git cuckoo


