bash ./common.sh

bash ./xfce.sh

apt-get -y install \
    chromium \
    evince \
    exiftran \
    flashplugin-nonfree \
    geeqie \
    gparted \
    gstreamer1.0-libav \
    gstreamer1.0-plugins-good \
    lm-sensors \
    mesa-utils \
    mpv \
    ntfs-3g \
    pepperflashplugin-nonfree \
    rfkill \
    vlc \
    wireless-tools \
    xfonts-100dpi \
    xfonts-75dpi \
    xfonts-base \
    xfonts-encodings \
    xfonts-scalable \
    xfonts-terminus \
    xfonts-unifont \
    xfonts-utils \
    xscreensaver \
    xserver-xorg \
    xserver-xorg-input-all \
    xserver-xorg-input-kbd \
    xserver-xorg-input-mouse \
    xserver-xorg-input-synaptics \
    xterm \
    xvnc4viewer \
    youtube-dl

apt-get -y auto-remove

cp rc/sources.list.d/google.list /etc/apt/sources.list.d/
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
apt-get -y install \
    google-chrome-stable

for home in /home/* ; do
    if [[ "$home" != "/home/lost+found" ]] ; then
        mkdir -p "$home/.config/gtk-3.0/"
        cat << EOF > $home/.config/gtk-3.0/settings.ini
[Settings]
gtk-primary-button-warps-slider = false
EOF
    fi
done

echo " maybe add this in /etc/default/grub ? (fix screen backlight stuff)"
echo "GRUB_CMDLINE_LINUX_DEFAULT=\"quiet acpi_osi=\""
read
