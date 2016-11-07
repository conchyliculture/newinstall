#!/bin/bash

if [[ $(umask) != "0077"  ]]; then
    echo "session optional pam_umask.so umask=0077" >> /etc/pam.d/common-session
    echo "Changed default umask. Please relog"
    exit 1
fi

apt-get update ; apt-get -y dist-upgrade

apt-get -y install \
    atop \
    bash \
    bash-completion \
    ca-certificates \
    cryptsetup \
    dnsutils \
    ethtool \
    file \
    firmware-linux-free \
    git \
    gzip \
    htop \
    iotop \
    less \
    locate \
    lshw \
    lsof \
    lvm2 \
    manpages
    mc \
    ncdu \
    netcat-traditional \
    nfs-common \
    openssh-client openssh-server \
    openssl \
    p7zip-full \
    pv \
    rsync \
    rsyslog \
    ruby \
    screen \
    sqlite3 \
    sshfs \
    strace \
    sysv-rc sysvinit-core \
    tcpdump \
    tsocks \
    vim \
    wget \
    whois

echo -e "Package: systemd-sysv\nPin: release o=Debian\nPin-Priority: -1" > /etc/apt/preferences.d/no-systemd

echo "blacklist pcspkr > /etc/modprobe.d/blacklist.conf"

echo "# J'aurais pu commenter plus haut mais ca se scripte moins bien " >> /etc/bash.bashrc
echo "source /etc/profile.d/bash_completion.sh" >> /etc/bash.bashrc


cp rc/vimrc /root/.vimrc
mkdir -p /root/.vimbackup

for bashrc in /home/*/.bashrc; do 
    cat rc/bashrc_append >> ${bashrc}
done
sed -i "s/HISTFILESIZE=1000/HISTFILESIZE=1000000000/" /etc/skel/.bashrc
sed -i "s/HISTSIZE=2000/HISTSIZE=1000000/" /etc/skel/.bashrc
echo "HISTTIMEFORMAT=\"%F %T \"" >> /etc/skel/.bashrc

echo "blacklist pcspkr" > /etc/modprobe.d/blacklist-pcspkr.conf
