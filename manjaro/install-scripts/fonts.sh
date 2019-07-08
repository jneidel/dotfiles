echo "##### install fonts #####"

mkdir -p ~/.fonts;

echo "install font-awesome"
FAV=5.1.0

wget https://github.com/FortAwesome/Font-Awesome/archive/$FAV.tar.gz -O ~/.fonts/fa.tgz;
cd ~/.fonts;
tar xzf fa.tgz;
rm fa.tgz;
mv ./Font-Awesome-$FAV/web-fonts-with-css/webfonts/fa-regular-400.ttf ./font-awesome-$FAV.ttf;
rm -rf Font-Awesome-$FAV;

echo  "install yosemite-san-francisco"

wget https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip -O ~/.fonts/yosemite-sf.zip;
cd ~/.fonts;
unzip yosemite-sf.zip;
mv YosemiteSanFranciscoFont-master/System\ San\ Francisco\ Display\ Regular.ttf yosemite-san-francisco.ttf;
rm -rf yosemite-sf.zip YosemiteSanFranciscoFont-master;

