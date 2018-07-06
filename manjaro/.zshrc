### Zsh Options

USER_DIR="/home/jneidel"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ZSH=$USER_DIR/.oh-my-zsh
ZSH_THEME="cobalt2"

HIST_STAMP="dd.mm.yyyy"
CASE_SENSITIVE="true"

plugins=( z zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

export PATH=~/.bin:/usr/local/sbin:/usr/local/bin:/usr/bin:~/.bin/node-latest/bin:~/.bin/ruby-latest/bin
export CDPATH=.:~:~/code

bindkey -v # vi mode
export KEYTIMEOUT=1
export EDITOR=vim
export BROWSER=/usr/bin/chromium
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# X related
export XAUTHORITY=/home/jneidel/.Xauthority
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

