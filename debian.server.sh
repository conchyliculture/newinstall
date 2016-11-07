#!/bin/bash
bash ./common.sh

apt-get -y install \
    postfix \
    logcheck \
    linux-image-amd64 

echo "logcheck: root" >> /etc/aliases
newaliases

echo "precedence ::ffff:0:0/96 100" >> /etc/gai.conf 

cp sources.list_jessie /etc/apt/sources.list

cp debian.fw /etc/init.d/firewall
chmod u+x /etc/init.d/firewall

#cp rc/logrotate.d/* /etc/logrotate.d/
#cp rc/ignore.d.server/* /etc/logcheck/ignore.d.server/

cp rc/rsyslog.d/dhclient.conf /etc/rsyslog.d/
cp rc/rsyslog.d/postfix.conf /etc/rsyslog.d/
service rsyslog restart

echo "Updated /etc/sysctl.d/grsec.conf, reboot, BUT AFTER CHECKING THE FW" 
