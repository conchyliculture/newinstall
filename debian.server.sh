#!/bin/bash
set -e
bash ./common.sh

apt-get install postfix logcheck linux-grsec-base lxc

vimdiff rc/grsec.conf /etc/sysctl.d/grsec.conf

cp sources.list_jessie /etc/apt/sources.list
cp debian.fw /etc/init.d/firewall

echo "Updated /etc/sysctl.d/grsec.conf, reboot, BUT AFTER CHECKING THE FW" 

