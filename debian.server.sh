#!/bin/bash
set -e
sh ./common

apt-get install postfix logcheck linux-grsec-base lxc

cp sources.list_jessie /etc/apt/sources.list
cp debian.fw /etc/init.d/firewall



