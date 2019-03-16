# Zsh config

## oh-my-zsh
OMZ=~/.oh-my-zsh;
HIST_STAMP="dd.mm.yyyy"

_Z_DATA=$HOME/.z/.z
plugins=( z zsh-syntax-highlighting )

source $OMZ/oh-my-zsh.sh
source $OMZ/themes/cobalt2.zsh-theme;

bindkey -v # shell vim mode (default emacs)

## Export variables
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=/usr/bin/vim

## Import aliases
source ~/.zsh/init.zsh;

