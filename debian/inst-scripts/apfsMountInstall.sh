apt install fuse libfuse-dev libicu-dev bzip2 libbz2-dev cmake clang git libattr1-dev libfuse3-dev -y

git clone https://github.com/sgan81/apfs-fuse.git
cd apfs-fuse
git submodule init
git submodule update

mkdir build
cd build
cmake ..
make

cp apfs-* /usr/local/bin
