#!/bin/bash
set -e
bash ./common.sh

apt-get install postfix logcheck linux-image-amd64 linux-grsec-base lxc

echo "logcheck: root" >> /etc/aliases
newaliases

vimdiff rc/grsec.conf /etc/sysctl.d/grsec.conf

echo "precedence ::ffff:0:0/96 100" >> /etc/gai.conf 

cp sources.list_jessie /etc/apt/sources.list
cp debian.fw /etc/init.d/firewall
chmod u+x /etc/init.d/firewall

echo "Updated /etc/sysctl.d/grsec.conf, reboot, BUT AFTER CHECKING THE FW" 

