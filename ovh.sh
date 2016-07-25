#!/bin/bash

# Remove ovh keys
sed -i '/ovh/d' /root/.ssh/authorized_keys
sed -i '/ovh/d' /root/.ssh/authorized_keys2

# disable OVH monitoring thing
sed -e '/rtm/ s/^#*/#/' -i /etc/crontab
echo "Don't forget to disable monitoring in OVH's manager"

