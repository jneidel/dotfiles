echo "##### install keepass #####";

sudo pacman -S keepass;

sudo wget https://raw.github.com/pfn/keepasshttp/master/KeePassHttp.plgx -O /usr/share/keepass/KeePassHttp.plgx;
chmod 644 /usr/share/keepassxc/KeePassHttp.plgx;

