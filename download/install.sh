#!/bin/bash

if [ -e /etc/lsb-release ] 
then
TYPE=ubuntu
elif [ -e /etc/redhat-release ]
then
TYPE=redhat
elif [ -e /etc/debian_version ]
then
TYPE=debian
else
TYPE=generic
fi;

case "$TYPE" in
   ubuntu)
     `sudo apt-get -y update ; sudo apt-get -y install collectd ; sudo apt-get -y install ruby1.9.3 ; sudo gem install stomp ; sudo mkdir -p /opt/openescalar/ ; sudo wget -O /opt/openescalar/amun-client.tar.gz http://www.openescalar.org/download/amun-client.tar.gz ; sudo tar xvfz /opt/openescalar/amun-client.tar.gz -C /opt/openescalar/ ; sudo ln -s /opt/openescalar/amun-client/bin/amun-client /etc/init.d/ `
     ;;
   redhat)
     `wget -O /root/epel-release-6-8.noarch.rpm http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm ; rpm -ivh /root/epel-release-6-8.noarch.rpm ; yum install -y --nogpgcheck collectd collectd-rrdtool rsyslog rubygem-stomp ; mkdir -p /opt/openescalar/ ; wget -O /opt/openescalar/amun-client.tar.gz http://www.openescalar.org/download/amun-client.tar.gz ; tar xvfz /opt/openescalar/amun-client.tar.gz -C /opt/openescalar/ ; ln -s /opt/openescalar/amun-client/bin/amun-client /etc/init.d/ `

     ;;
   debian)
     `apt-get update ; apt-get -y install collectd ; apt-get -y install ruby ; apt-get -y install rubygems ; gem install stomp ; mkdir -p /opt/openescalar/ ; wget -O /opt/openescalar/amun-client.tar.gz http://www.openescalar.org/download/amun-client.tar.gz ; tar xvfz /opt/openescalar/amun-client.tr.gz -C /opt/openescalar/ ; ln -s /opt/openescalar/amun-client/bin/amun-client /etc/init.d/ `
     ;;
esac
