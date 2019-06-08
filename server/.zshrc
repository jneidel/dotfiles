# Zsh config

## oh-my-zsh
OMZ=~/.oh-my-zsh;
HIST_STAMP="dd.mm.yyyy"

source $OMZ/oh-my-zsh.sh
source $OMZ/themes/cobalt2.zsh-theme;

bindkey -v # shell vim mode (default emacs)

## Export variables
export TERM=screen-256color
# you might need to fix your locales for these to apply
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim

## Import aliases
source ~/.zsh/init.zsh;

