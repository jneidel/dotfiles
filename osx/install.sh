# oh-my-zsh install

BASE=https://raw.githubusercontent.com/jneidel/dotfiles/master/;
MAC=$BASE"mac/";

wget $BASE"oh-my-zsh" -O ~/.oh-my-zsh/oh-my-zsh.zsh;
wget $BASE"cobalt2.zsh-theme" -O ~/.oh-my-zsh/themes/cobalt2.zsh-theme;
wget $MAC"aliases.zsh" -O ~/.oh-my-zsh/custom/aliases.zsh;
wget $MAC".gitignore" -O ~/.gitignore;
wget $MAC".tmux.conf" -O ~/.tmux.conf;
wget $MAC".vimrc" -O ~/.vimrc;
wget $MAC".zshrc" -O ~/.zshrc;
mkdir ~/.tmux;
wget $MAC".tmux/battery" -O ~/.tmux/battery;
wget $MAC".tmux/itunes" -O ~/.tmux/itunes;
wget $MAC"brogrammer.itermcolors" -O ~/Desktop/brogrammer.itermcolors
wget $BASE".eslintrc" -O ~/.eslintrc
wget $MAC"settings.json" -O ~/Library/Application\ Support/Code/User/settings.json
wget $MAC"keybindings.json" -O ~/Library/Application\ Support/Code/User/keybindings.json

# zsh plugins
# vim plugins

