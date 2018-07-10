D=~/code/dotfiles/manjaro;

cp ~/.oh-my-zsh/oh-my-zsh.sh $D/../oh-my-zsh.sh;
cp ~/.zsh/aliases.zsh $D/aliases.zsh;
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
cp ~/.i3status.conf $D/.i3status.conf;
cp ~/.config/transmission/settings.json $D/transmission/;
cp ~/.drive/update.sh $D/.scripts/update-google-drive.sh;

