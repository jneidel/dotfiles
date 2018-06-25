D=~/code/dotfiles/manjaro;

cp ~/.oh-my-zsh/custom/aliases.zsh $D/aliases.zsh;
cp ~/.gitconfig $D/.gitconfig;
cp ~/.gitignore $D/.gitignore;
cp ~/.i3/config $D/.i3/config;
cp ~/.config/terminator/config $D/terminator/config;
cp ~/.tmux.conf $D/.tmux.conf;
rm -rf $D/.vim;
cp -r ~/.vim $D/.vim;
cp ~/.vimrc $D/.vimrc;
cp ~/.Xmodmap $D/.Xmodmap;
cp ~/.config/Zeal/Zeal.conf $D/Zeal.conf;
cp ~/.zshrc $D/.zshrc;
rm -rf $D/nitrogen;
cp -r ~/.config/nitrogen $D/nitrogen;

