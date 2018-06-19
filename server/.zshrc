### Zsh Options

USER_DIR="/home/user/jneidel"
MAIL=$USER_DIR/Mail/INBOX

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ZSH=$USER_DIR/.oh-my-zsh
ZSH_THEME="cobalt2"

HIST_STAMP="dd.mm.yyyy"
CASE_SENSITIVE="true"

plugins=( z zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh
source $ZSH/custom/aliases-personal.zsh

export PATH=/usr/local/bin:/usr/bin:/bin:~guckes/bin
export CDPATH=.:~

bindkey -v # vi mode
export KEYTIMEOUT=1
export EDITOR=vim

source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

f; # fetch new mail when opening a new zsh

