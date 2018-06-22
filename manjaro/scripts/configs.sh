BASE=https://raw.githubusercontent.com/jneidel/dotfiles/master/;
LINUX=$BASE"manjaro/";

echo "##### install configs #####";

echo "install tmux conf";
wget $LINUX".tmux.conf" -O ~/.tmux.conf;

echo "install vim conf";
wget $LINUX".vimrc" -O ~/.vimrc;
mkdir -p ~/.vim/autoload;
mkdir -p ~/.vim/colors;
mkdir -p ~/.vim/tmp;
mkdir -p ~/.vim/swap;
mkdir -p ~/.vim/backup;
mkdir -p ~/.vim/spell;
wget $LINUX".vim/autoload/oldhope.vim" -O ~/.vim/autoload/oldhope.vim;
wget $LINUX".vim/colors/old-hope.vim" -O ~/.vim/colors/old-hope.vim;
wget $LINUX".vim/spell/en.utf-8.add" -O ~/.vim/spell/en.utf-8.add;
wget $LINUX".vim/spell/en.utf-8.add.spl" -O ~/.vim/spell/en.utf-8.add.spl;

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

