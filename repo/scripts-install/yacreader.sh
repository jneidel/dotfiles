#! /bin/sh

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ yacreader.sh
Compile YACReader version 9.

Build dependencies: libunarr poppler-qt5 glu qt5-base qt5-multimedia qt5-script qt5-quickcontrols qt5-graphicaleffects

Dependency list from INSTALL.md and https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=yacreader
"; exit
fi

command -v qmake-qt5 >/dev/null || { echo "qmake-qt5 is not installed"; exit 1; }

TMP_TAR=/tmp/yacreader9.tar.xz

echo "installing dependencies with yay"
yay -S libunarr poppler-qt5 glu qt5-base qt5-multimedia qt5-script qt5-quickcontrols qt5-graphicaleffects

echo "downloading yacreader 9.0"
wget -nc https://jneidel.com/yacreader9.tar.xz -O $TMP_TAR
cd /tmp
tar xf $TMP_TAR
cd yacreader-9.0.0

echo "make yacreader"
qmake-qt5
make
echo "install yacreader"
sudo make install

