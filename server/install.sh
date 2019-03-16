D=https://raw.githubusercontent.com/jneidel/dotfiles/master
M=$D/manjaro
S=$D/server

echo "# Install tmux config"
echo "## Write ~/.tmux.conf"
wget -q $S/.tmux.conf -O ~/.tmux.conf
# wget -q $S/.tmux.conf-1.8 -O ~/.tmux.conf # Use if your tmux version is 1.x
echo "## Write ~/.tmux/maximize-pane"
mkdir -p ~/.tmux
wget -q $S/.tmux/maximize-pane -O ~/.tmux/maximize-pane

echo "# Install vim config"
echo "## Write ~/.vimrc"
wget -q $S/.vimrc -O ~/.vimrc
echo "## Write .vim/* directories"
mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/sessions
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/colors
echo "## Write vim color files"
wget -q $M/.vim/colors/old-hope.vim -O ~/.vim/colors/old-hope.vim
wget -q $M/.vim/autoload/oldhope.vim -O ~/.vim/autoload/oldhope.vim

echo "# Install zsh config"
echo "## Append to ~/.zshrc"
curl -fsSL $S/.zshrc 1>> ~/.zshrc 2>&1
echo "## Write alias files"
mkdir -p ~/.zsh
wget -q $M/.zsh/init.zsh -O ~/.zsh/init.zsh
wget -q $M/.zsh/git.zsh -O ~/.zsh/git.zsh
wget -q $M/.zsh/npm.zsh -O ~/.zsh/npm.zsh
wget -q $M/.zsh/ls.zsh -O ~/.zsh/ls.zsh
wget -q $M/.zsh/tmux.zsh -O ~/.zsh/tmux.zsh
wget -q $M/.zsh/misc.zsh -O ~/.zsh/misc.zsh

