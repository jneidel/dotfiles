YACV=9.0.0 # latest: https://bitbucket.org/luisangelsm/yacreader/downloads/

echo "##### install yacreader v"$YACV" #####";

wget https://bitbucket.org/luisangelsm/yacreader/downloads/yacreader-$YACV-src.tar.xz -O yacreader.tar.xz;
tar xf yacreader.tar.xz;
rm yacreader.tar.xz;
cd yacreader-$YACV;
# sudo pacman -S poppler-qt5 qt5-multimedia qt5-script;
# yaourt -S libunarr;
qmake-qt5;
make;
sudo make install;
cd ..;
rm -rf yacreader-$YACV;

