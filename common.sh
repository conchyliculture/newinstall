#!/bin/bash

apt-get update ; apt-get dist-upgrade

apt-get install bash wget vim less bash-completion htop atop iotop tcpdump strace screen ruby ncdu mc ca-certificates \
    lshw \
    tsocks \
    whois \
    lsof \
    cryptsetup \
    ethtool \
    dnsutils \
    git \
    lvm2 \
    file \
    openssl \
    openssh-client openssh-server \
    p7zip-full \
    nfs-common \
    netcat-traditional \
    gzip \
    pv \
    locate \
    rsync \
    rsyslog \
    sysv-rc sysvinit-core \
    ca-certificates \
    manpages

echo -e "Package: systemd-sysv\nPin: release o=Debian\nPin-Priority: -1" > /etc/apt/preferences.d/no-systemd

echo "blacklist pcspkr > /etc/modprobe.d/blacklist.conf"

echo "# J'aurais pu commenter plus haut mais ca se scripte moins bien " >> /etc/bash.bashrc
echo "source /etc/profile.d/bash_completion.sh" >> /etc/bash.bashrc


cp rc/vimrc /root/.vimrc
mkdir -p /root/.vimbackup

cat rc/bashrc_append >> /root/.bashrc

