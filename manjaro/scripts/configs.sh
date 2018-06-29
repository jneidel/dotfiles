BASE=https://raw.githubusercontent.com/jneidel/dotfiles/master/;
LINUX=$BASE"manjaro/";

echo "##### install configs #####";

echo "install tmux conf";
wget $LINUX".tmux.conf" -O ~/.tmux.conf;

echo "install i3 conf";
mkdir -p ~/.i3;
wget $LINUX".i3/config" -O ~/.i3/config;

echo "install cmus conf";
mkdir -p ~/.cmus;
wget $LINUX".cmus/rc" -O ~/.cmus/rc;
cp ~/.cmus/rc ~/.cmus/autosave;

echo "install asound conf";
wget $LINUX".asoundrc" -O ~/.asoundrc;

echo "install terminator conf";
mkdir -p ~/.config/terminator;
wget $LINUX"terminator/config" -O ~/.config/terminator/config;

echo "install zeal conf";
mkdir -p ~/.config/Zeal;
wget $LINUX"Zeal.conf" -O ~/.config/Zeal/Zeal.conf;

# wget $LINUX".mangareader-dl.json" -O ~/.mangareader-dl.json;

echo "install ssh conf";
mkdir -p ~/.ssh;
wget $LINUX".ssh/config" -O ~/.ssh/config;

echo "install git conf";
wget $LINUX".gitconfig" -O ~/.gitconfig;
wget $LINUX".gitignore" -O ~/.gitignore;

