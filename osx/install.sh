# oh-my-zsh install

BASE=https://raw.githubusercontent.com/jneidel/dotfiles/master/
MAC=$BASE"osx/"

wget $BASE"oh-my-zsh.sh" -O ~/.oh-my-zsh/oh-my-zsh.zsh;
wget $BASE"cobalt2.zsh-theme" -O ~/.oh-my-zsh/themes/cobalt2.zsh-theme;
wget $MAC"aliases.zsh" -O ~/.oh-my-zsh/custom/aliases.zsh;
wget $BASE".gitignore" -O ~/.gitignore;
wget $MAC".tmux.conf" -O ~/.tmux.conf;
wget $MAC".vimrc" -O ~/.vimrc;
wget $MAC".zshrc" -O ~/.zshrc;
mkdir -p ~/.tmux;
wget $MAC".tmux/battery" -O ~/.tmux/battery;
wget $MAC".tmux/itunes" -O ~/.tmux/itunes;
wget $BASE".eslintrc" -O ~/.eslintrc

# iTerm
wget $MAC"brogrammer.itermcolors" -O ~/Desktop/brogrammer.itermcolors
wget https://github.com/powerline/fonts/blob/master/RobotoMono/Roboto%20Mono%20Medium%20for%20Powerline.ttf -O ~/Desktop/roboto-mono.ttf

#wget $MAC"settings.json" -O ~/Library/Application\ Support/Code/User/settings.json
#wget $MAC"keybindings.json" -O ~/Library/Application\ Support/Code/User/keybindings.json

# zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# vim
mkdir -p ~/.vim/backup ~/.vim/swap
## colors
mkdir -p ~/.vim/autoload ~/.vim/colors
wget https://raw.githubusercontent.com/j-tom/vim-old-hope/master/autoload/oldhope.vim -O ~/.vim/autoload/oldhope.vim
wget https://raw.githubusercontent.com/j-tom/vim-old-hope/master/colors/old-hope.vim -O ~/.vim/colors/old-hope.vim
## bundle managers
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

