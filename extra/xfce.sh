apt -y install lightdm \
    xfce4 \
    xfce4-goodies \
    xfce4-power-manager \
    xfce4-battery-plugin

echo "You might want to change these in /etc/systemd/logind.conf :"
#echo "HandleLidSwitch=ignore"
echo "HandlePowerKey=ignore" 
read
