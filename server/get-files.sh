#! /bin/bash

D=~/code/dotfiles
S=$D/server
M=$D/manjaro

# Commented files have been edited,
# removing personal & irrelevant stuff

## tmux
#cp $M/.tmux.conf $S
mkdir -p $S/.tmux
cp -r $M/.tmux/maximize-pane $S/.tmux

## vim
#cp $M/.vimrc $S

