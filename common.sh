#!/bin/bash

if [[ $(umask) == "0077"  ]]; then
    echo "session optional pam_umask.so umask=0077" >> /etc/pam.d/login
    echo "Changed default umask. Please relog"
    exit 1
fi

apt-get update ; apt-get dist-upgrade

apt-get install bash wget vim less bash-completion htop atop iotop tcpdump strace screen ruby ncdu mc ca-certificates \
    cryptsetup \
    git \
    lvm2 \
    openssl \
    openssh-client openssh-server \
    netcat-traditional \
    pv \
    rsync \
    rsyslog \
    sysv-rc sysvinit-core \
    manpages

echo -e "Package: systemd-sysv\nPin: release o=Debian\nPin-Priority: -1" > /etc/apt/preferences.d/no-systemd

echo "blacklist pcspkr > /etc/modprobe.d/blacklist.conf"

echo "# J'aurais pu commenter plus haut mais ca se scripte moins bien " >> /etc/bash.bashrc
echo "source /etc/profile.d/bash_completion.sh" >> /etc/bash.bashrc


cp rc/vimrc /root/.vimrc
mkdir -p /root/.vimbackup

cat rc/bashrc_append >> /root/.bashrc

cp rc/rsyslog.d/* /etc/rsyslog.d/
