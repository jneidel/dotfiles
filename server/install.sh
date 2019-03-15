D=https://raw.githubusercontent.com/jneidel/dotfiles/master
S=$D/server

echo "## Installing tmux config ##"
wget -q $S/.tmux.conf -O ~/.tmux.conf
mkdir -p ~/.tmux
wget -q $S/.tmux/maximize-pane -O ~/.tmux/maximize-pane

