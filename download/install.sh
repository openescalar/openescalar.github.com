#!/bin/bash

if [ -e /etc/lsb-release ]; then
TYPE=ubunu
fi
if [ -e /etc/redhat-release ]; then
TYPE=redhat
fi
if [ -e /etc/debian_version ]; then
TYPE=debian
fi;

echo "INSTALLING PACKAGES" >> /tmp/script.log
case "$TYPE" in
   ubuntu)
     echo "ubuntu" >> /tmp/script.log
     `apt-get update ; apt-get install collectd ; apt-get install ruby1.9.3 ; gem install stomp`
     ;;
   redhat)
     echo "redhat fork" >> /tmp/script.log
     `wget -O /root/epel-release-6-8.noarch.rpm http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm ; rpm -ivh /root/epel-release-6-8.noarch.rpm ; yum install -y --nogpgcheck collectd collectd-rrdtool rsyslog rubygem-stomp`
     ;;
   debian)
     echo "debian" >> /tmp/script.log
     `apt-get update ; apt-get -y install collectd ; apt-get -y install ruby ; apt-get -y install rubygems ; gem install stomp`
     ;;
esac
echo "created openescalar home" >> /tmp/script.log
mkdir -p /opt/openescalar/
echo "DONE" >> /tmp/script.log
