##############################
## Debian post-installation ##
##############################
# Created by Tiago Minuzzi

# Gnome extesions to install
# applicationsoverviewtooltip, kstatusnotifieritem, nightlightslider, openweather, soundinput&outputdevicechooser, windowoverlayicons

# System utilities
sudo apt install gnome-tweak-tool vim vlc build-essential git ssh openssh-server make flameshot chromium chrome-gnome-shell libappindicator3-1 terminator python3 python3-pip htop firmware-linux-nonfree redshift redshift-gtk caffeine fonts-font-awesome neofetch -y

# Flash-plugin
sudo apt install pepperflashplugin-nonfree browser-plugin-freshplayer-pepperflash -y

# Flatpak
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.elsevier.MendeleyDesktop com.spotify.Client com.sublimetext.three -y

# Possible firmwares needed: sudo apt install firmware-realtek firmware-iwlwifi -y
# wget https://github.com/winterheart/broadcom-bt-firmware/raw/master/brcm/BCM20702A1-0a5c-21e6.hcd
# sudo mkdir /lib/firmware/brcm
# sudo mv BCM20702A1-0a5c-21e6.hcd /lib/firmware/brcm/
