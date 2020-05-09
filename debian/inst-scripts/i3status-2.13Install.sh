apt install autoconf libconfuse-dev libyajl-dev libasound2-dev libiw-dev asciidoc libpulse-dev libnl-genl-3-dev -y

wget https://i3wm.org/i3status/i3status-2.13.tar.bz2
tar xjf i3status-2.13.tar.bz2

cd i3status-2.13/
autoreconf -fi
mkdir build &&\
cd build
../configure --disable-sanitizers
make -j8
make install
