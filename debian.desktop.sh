bash ./common.sh

apt-get install chromium compton evince exiftran flashplugin-nonfree geeqie \
    gparted \
    ntfs-3g \
    rfkill \
    vlc \
    mesa-utils \
    lm-sensors \
    wireless-tools \
    wicd-curses \
    xfonts-100dpi xfonts-75dpi xfonts-base xfonts-encodings xfonts-scalable xfonts-utils \
    gstreamer1.0-libav gstreamer1.0-plugins-good \
    xvnc4viewer \
    lightdm mpv xfce4 xterm 

apt-get auto-remove
