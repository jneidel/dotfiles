D=https://raw.githubusercontent.com/jneidel/dotfiles/master
S=$D/server

echo "### Installing tmux configs ###"
wget -q $S/.tmux.conf -O ~/.tmux.conf
# wget -q $S/.tmux.conf-1.8 -O ~/.tmux.conf # Use if your tmux version is 1.x
echo "#### Wrote ~/.tmux.conf"
mkdir -p ~/.tmux
wget -q $S/.tmux/maximize-pane -O ~/.tmux/maximize-pane
echo "#### Wrote ~/.tmux/maximize-pane"

