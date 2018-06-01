# test oh-my-zsh install

BASE=https://raw.githubusercontent.com/jneidel/dotfiles/master/;
LINUX=$BASE"linux/";

wget $BASE"oh-my-zsh" -O ~/.oh-my-zsh/oh-my-zsh.zsh;
wget $BASE"cobalt2.zsh-theme" -O ~/.oh-my-zsh/themes/cobalt2.zsh-theme;
wget $LINUX"aliases.zsh" -O ~/.oh-my-zsh/custom/aliases.zsh;
wget $LINUX".tmux.conf" -O ~/.tmux.conf;
wget $LINUX".vimrc" -O ~/.vimrc;
wget $LINUX".zshrc" -O ~/.zshrc;
mkdir ~/.i3;
wget $LINUX".i3/config" -O ~/.i3/config;

mkdir ~/.vim;
mkdir ~/.vim/autoload;
mkdir ~/.vim/colors;
mkdir ~/.vim/tmp;
mkdir ~/.vim/swap;
mkdir ~/.vim/backup;
mkdir ~/.vim/spell;
wget $LINUX".vim/autoload/oldhope.vim" -O ~/.vim/autoload/oldhope.vim;
wget $LINUX".vim/colors/old-hope.vim" -O ~/.vim/colors/old-hope.vim;
wget $LINUX".vim/spell/en.utf-8.add" -O ~/.vim/spell/en.utf-8.add;
wget $LINUX".vim/spell/en.utf-8.add.spl" -O ~/.vim/spell/en.utf-8.add.spl;
