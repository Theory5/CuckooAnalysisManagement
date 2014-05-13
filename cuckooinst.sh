#This is a cuckoo installation bash script, designed to make my life easier by automating a large portion of the cuckoo install
#This install script Is to be used on ubuntu server 12.04.4, has not been tested on a 14.04 install. 
#more information can be found in teh cuckoo change log. 
#built by Theory5 on 5/9/14 with a LOT of help from April and Ziggy.
#Use as you please, just give credit to the cuckoo guys and myself. (Cuckoo gets top billing, obviously).
#This install assumes that you only have a bare ubuntu or debian install

apt-get -y update


apt-get -y install libpcap0.8 libpcap0.8-dev libpcap-dev autogen gcc make libxml2-dev libgnutls-dev libcurl4-gnutls-dev \
python-dev libnl-dev build-essential autopoint xsltproc w3c-dtd-xhtml python-dev libxen-dev uuid-dev libdevmapper-dev \
python-dev libcurl4-gnutls-dev libnl-dev libgnutls-dev libpciaccess-dev libxml2-dev pm-utils ebtables libcap2-bin libcap-dev

#install pip & other python stuff
apt-get -y install python-setuptools python-pip

#install git, separated for easier reading

apt-get -y install git git-core

#install libvirt, KVM, and other packages necessary for KVM usage
#https://help.ubuntu.com/community/KVM/Installation
apt-get -y install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils

#install MORE cuckoo dependencies (these are optional)

apt-get install python-dpkt python-jinja2 python-magic python-pymongo python-gridfs python-libvirt python-bottle python-pefile python-chardet

#install libvirt and dependencies. If you are using ESX YOU MUST BUILD LIBVIRT YOURSELF, DO NOT USE THESE

apt-get build-dep libvirt-bin libvirt-dev

apt-get -y install libvirt-bin libvirt-dev

read -p "Since the last thing we want to do is run Cuckoo Sandbox as root, please enter a username to run cuckoo as (Hit enter to use cuckoo):" NAME
	echo "You Have Selected ${NAME:=cuckoo}. Really? You're choosing ${NAME}? Your choice..."
	
	if [ "$NAME" == "root" ]; then
		echo "root is not allowed"

		elif ! grep -q "^${NAME}:" /etc/passwd && $? -eq 1; then
			echo "sorry, that username is already taken. Please pick another."

else		sudo adduser ${NAME}
		sudo groupadd -f libvirtd
		sudo usermod -G libvirtd ${NAME}
fi

#Install TCPDUMP

sudo apt-get -y install tcpdump

#setup configuration for TCPDUMP to run without needing root

setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump

#you can verify this last command by running: getcap /usr/sbin/tcpdump

#use pip to install bottle, Sqlalchemy

pip install sqlalchemy bson

pip install jinja2 pymongo bottle pefile maec==4.0.1.0 django chardet

#cd to main dir and create working folder

cd

mkdir cuckooinst

cd cuckooinst

#clone cuckoo
git clone --recursive https://github.com/cuckoobox/cuckoo.git cuckoo

#back to root

cd

 
