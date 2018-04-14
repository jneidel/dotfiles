### Zsh Options

USER_DIR="/Users/jneidel"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ZSH=$USER_DIR/.oh-my-zsh
ZSH_THEME="cobalt2"

HIST_STAMP="dd.mm.yyyy"
CASE_SENSITIVE="true"

plugins=( z zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

export PATH=/opt/local/bin:/sw/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/.bin:/opt/X11/bin:$USER_DIR/.vimpkg/bin
export CDPATH=.:~:~/Programming

bindkey -v # vi mode
export KEYTIMEOUT=1
export EDITOR=vim

### Apps
# Commented out to speed up zsh boot time

#source /sw/bin/init.sh # Setup fink path

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

