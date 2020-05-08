##############################
## Debian post-installation ##
##############################

# System utilities
sudo apt install gnome-tweak-tool vim vlc buil-essential git ssh openssh-server make flameshot chromium chrome-gnome-shell libappindicator3-1 terminator python3 python3-pip htop firmware-linux-nonfree plymouth plymouth-themes redshift redshift-gtk caffeine font-fonts-awesome neofetch -y

# Flash-plugin
sudo apt install pepperflashplugin-nonfree browser-plugin-freshplayer-pepperflash -y

# Flatpak
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.elsevier.MendeleyDesktop com.spotify.Client com.sublimetext.three -y

# Python utils
sudo pip3 install docopt ewmh setproctitle wheel xdg

# i3 stuff
sudo apt install i3 i3lock dmenu rofi lxappearance nitrogen py3status pavucontrol pasystray pulseaudio-utils arandr -y

# for i3-only (no desktop manager)
# sudo apt install lightdm xserver-xorg xinit xserver-xorg-input-libinput network-manager-gnome evince nemo clipit file-roller xbacklight acpi xfce4-power-manager xbindkeys -y
# echo 'exec i3' > ~/.xsession && sudo reboot
# Possible firmwares needed: sudo apt install firmware-realtek firmware-iwlwifi -y
# wget https://github.com/winterheart/broadcom-bt-firmware/raw/master/brcm/BCM20702A1-0a5c-21e6.hcd
# sudo mkdir /lib/firmware/brcm
# sudo mv BCM20702A1-0a5c-21e6.hcd /lib/firmware/brcm/

# Gnome extesions to install
# kstatusnotifiers, openweather, sound input & output device choser, multi monitors add-on, applications overview tooltip, windowoverlay icons.
