BASE=https://raw.githubusercontent.com/jneidel/dotfiles/master/;
LINUX=$BASE"manjaro/";

echo "##### install zsh #####";
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

echo "copy configs";
wget $BASE"oh-my-zsh" -O ~/.oh-my-zsh/oh-my-zsh.zsh;
wget $BASE"cobalt2.zsh-theme" -O ~/.oh-my-zsh/themes/cobalt2.zsh-theme;
wget $LINUX"aliases.zsh" -O ~/.oh-my-zsh/custom/aliases.zsh;
wget $LINUX".zshrc" -O ~/.zshrc;

