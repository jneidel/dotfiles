YACV=9.0.0 # < v9.0.0: https://bitbucket.org/luisangelsm/yacreader/downloads
#YACV=9.5.0 # > v9.5.0: https://github.com/YACReader/yacreader/releases
# v9.5.0 is broken

echo "##### install yacreader v"$YACV" #####";

wget https://bitbucket.org/luisangelsm/yacreader/downloads/yacreader-$YACV-src.tar.xz -O yacreader.tar.xz;
# wget https://github.com/YACReader/yacreader/releases/download/$YACV/yacreader-$YACV-src.tar.xz -O yacreader.tar.xz;

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

