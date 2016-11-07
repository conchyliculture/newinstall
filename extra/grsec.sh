apt-get -y install \
    linux-image-grsec-amd64:amd64 \
	paxctl \
	pax-utils \
cp rc/logrotate.d/grsec /etc/logrotate.d/
cp rc/ignore.d.server/grsec /etc/logcheck/ignore.d.server/
cp rc/rsyslog.d/grsec.conf /etc/rsyslog.d/
service rsyslog restart
