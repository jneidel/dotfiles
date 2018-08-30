PIAV=81; # latest: https://www.privateinternetaccess.com/pages/download

echo "##### install pia #####";

wget https://installers.privateinternetaccess.com/download/pia-v$PIAV-installer-linux.tar.gz -O ./pia.tar.gz;
tar xzf pia.tar.gz;
rm pia.tar.gz;
./pia.v$PIAV-installer-linux.sh;

mv ~/pia.sh ~/.bin/private-internet-access;
ln -s ~/.bin/private-internet-access ~/.bin/pia;

