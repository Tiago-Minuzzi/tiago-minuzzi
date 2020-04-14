################################################
## FLASH PLAYER PLUGIN INSTALLATION ON DEBIAN ##
################################################

## Mozilla:
# Download flash_player_npapi_linux.x86_64.tar.gz in https://get.adobe.com/br/flashplayer/
# tar xzf flash_player_npapi_linux.x86_64.tar.gz 
# sudo cp libflashplayer.so /usr/lib/mozilla/plugins/
# sudo cp usr/* /usr/ -r

## Chrome, Chromium & derivates:
sudo apt install pepperflashplugin-nonfree browser-plugin-freshplayer-pepperflash -y
