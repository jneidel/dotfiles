#! /bin/bash

echo "### install runwhen ###"
# docs at: http://code.dogmap.org/runwhen/

echo "installing dependencies"
sudo packer-aur -S skalibs

echo "downloading sourcecode"
cd ~/.bin
wget http://code.dogmap.org/runwhen/runwhen.tar.bz2
extract runwhen.tar.bz2
rm runwhen.tar.bz2
cd runwhen.tar/admin/runwhen-*

echo "compiling"
pwd > ./conf-compile/defaults/package_home
sudo ./package/install

