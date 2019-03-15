#! /bin/bash

D=~/code/dotfiles
S=$D/server
M=$D/manjaro

#cp $M/.tmux.conf $S # removed personal and irrelevant stuff
mkdir -p $S/.tmux
cp -r $M/.tmux/maximize-pane $S/.tmux

