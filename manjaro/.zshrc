# Zsh config

# oh-my-zsh
OMZ=~/.oh-my-zsh;
HIST_STAMP="dd.mm.yyyy"

_Z_DATA=$HOME/.z/.z
plugins=( z encode64 urltools cp )
# z: jump around, $ z dot, to cd into dir thats most often used an includes 'dot' in the name, i.e. "dotfiles"
# encode64: $ d64; $ e64
# test cp: cpv

source $OMZ/oh-my-zsh.sh
source $OMZ/themes/cobalt2.zsh-theme;
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# installed with pacman: zsh-syntax-highlighting[-git]

bindkey -v # shell vim mode (default emacs)
export KEYTIMEOUT=1

#[[ -f $HOME/.LS_COLORS ]] && eval "`dircolors -b $HOME/.LS_COLORS`"

# Import aliases
source ~/.zsh/init.zsh;

export ALT_BROWSER=chromium
