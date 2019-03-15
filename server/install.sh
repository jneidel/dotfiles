D=https://raw.githubusercontent.com/jneidel/dotfiles/master
S=$D/server

echo "# Install tmux configs"
wget -q $S/.tmux.conf -O ~/.tmux.conf
# wget -q $S/.tmux.conf-1.8 -O ~/.tmux.conf # Use if your tmux version is 1.x
echo "## Wrote ~/.tmux.conf"
mkdir -p ~/.tmux
wget -q $S/.tmux/maximize-pane -O ~/.tmux/maximize-pane
echo "## Wrote ~/.tmux/maximize-pane"

echo "# Install vim config"
wget -q $S/.vimrc -O ~/.vimrc
echo "## Wrote ~/.vimrc"
mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/sessions
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/colors
echo "## Created .vim/* directories"
wget -q $M/.vim/colors/old-hope.vim -O ~/.vim/colors/old-hope.vim
wget -q $M/.vim/autoload/oldhope.vim -O ~/.vim/autoload/oldhope.vim
echo "## Wrote vim color files"

