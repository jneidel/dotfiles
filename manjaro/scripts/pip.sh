echo "##### pip #####"

echo "install pip"

pacman -S python-pip;

# or manually
# wget https://bootstrap.pypa.io/get-pip.py -O ~/get-pip.py
# sudo python ~/get-pip.py;
# rm ~/get-pip.py;

echo "install pip packages"

sudo pip install grip;

