# Zsh config

# oh-my-zsh
ZSH_DIR=~/.zsh
source $ZSH_DIR/oh-my-zsh.sh
source $ZSH_DIR/lib/init.zsh
source $ZSH_DIR/cobalt2.zsh-theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# installed with pacman: zsh-syntax-highlighting[-git]

bindkey -v # shell vim mode (default emacs)
bindkey "^r" history-incremental-pattern-search-backward # history search
export KEYTIMEOUT=1

## Colors
autoload -U colors && colors
zstyle ':completion:*' list-colors 'di=01;34:ln=35:so=32:pi=33:ex=01;32:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30' # in completion

## Options
# http://bolyai.cs.elte.hu/zsh-manual/zsh_16.html
setopt MULTIOS
setopt PROMPT_SUBST

## Language
export LANG=en_US.UTF-8
# tmux needs to know the encoding: https://github.com/wernight/powerline-web-fonts/issues/8#issuecomment-353081869
export LC_CTYPE=en_US.UTF-8
if [ "$TERM" = "tmux-256color" ]; then
  export DISPLAY=:0
fi

## Paths
export PATH=$HOME/.local/bin:/usr/local/bin:/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/site_perl:$HOME/.cargo/bin
export PATH="$(du $HOME/scripts/ | cut -f2 | grep -Fve .git -e node_modules -e lib -e data | tr '\n' ':')$PATH"
export CDPATH=.:~:~/code:~/Downloads:~/org:~/org/0_inbox:~/org/1_design:~/org/2_project:~/org/3_areas:~/org/4_resources:~/org/4_resources/media:~/scripts:~/.config:~/code/notes

## Applications
export EDITOR=vim
export PAGER=less
export LESS="-R"
export BROWSER=brave
export B=$BROWSER
export ALT_BROWSER=firefox-developer-edition
export NODE_PATH=/usr/lib/node_module
# for eslint, see: https://github.com/eslint/eslint/issues/11914#issuecomment-525498682
export LUA_SERVER_PATH="$HOME/.local/share/nvim/lua-language-server"

### Themes
export GTK_THEME=Arc
export BAT_THEME=ansi

#### less coloring (man pages), see colored-man script
export LESS_TERMCAP_mb=$'\e[1;34m'
# headlines, hyperlinks - yellow
export LESS_TERMCAP_md=$(tput bold; tput setaf 3)
export LESS_TERMCAP_me=$'\e[0m'
# less status/search matches - blue
export LESS_TERMCAP_so=$(tput bold; tput rev; tput setaf 4)
export LESS_TERMCAP_se=$'\e[0m'
# commands - red, underlined
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1)
export LESS_TERMCAP_ue=$'\e[0m'

### Application options
export FZF_DEFAULT_OPTS="--height 50% --no-mouse --ansi --color=16"

## User specific
export KEYID=B29E6A7A7DFD16FA # GPG keyid

test -f "$HOME/.config/broot/launcher/bash/br" && source $HOME/.config/broot/launcher/bash/br

### Config dirs
# reduce number of files in the home dir
# see: https://wiki.archlinux.org/index.php/XDG_Base_Directory
# see: https://github.com/LukeSmithxyz/voidrice/blob/master/.profile
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_DATA_HOME:-$HOME/.local/state}"
export XDG_CONFIG_RC="${XDG_DATA_HOME}"
export LESSHISTFILE="-"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export npm_config_cache="${XDG_CACHE_HOME}/npm"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export VOLTA_HOME="$XDG_DATA_HOME/volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java"
export MPLAYER_HOME="${XDG_CONFIG_HOME}/mplayer"
export MYSQL_HISTFILE="${XDG_DATA_HOME}/mysql_history"
export PSQL_HISTORY="${XDG_CACHE_HOME}/psql_history"
export REDISCLI_HISTFILE="${XDG_DATA_HOME}/redis/rediscli_history"
export TERMINFO="${XDG_DATA_HOME}/terminfo"
export TERMINFO_DIRS="${XDG_DATA_HOME}/terminfo:/usr/share/terminfo"
export ANDROID_HOME="$XDG_DATA_HOME"/android
export GRIPHOME="$XDG_CONFIG_HOME/grip"
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg"
export GOPATH="${XDG_DATA_HOME}/go"
export NETRC="$XDG_DATA_HOME"
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

# kitty shell integration
test -e "/usr/lib/kitty/shell-integration/kitty.zsh" && source "/usr/lib/kitty/shell-integration/kitty.zsh"

# Import aliases
source $ZSH_DIR/org.zsh
source $ZSH_DIR/init.zsh

# start xorg on first login into the tty
# runs commands in ~/.xinitrc
if [ "$(tty)" = "/dev/tty1" ]; then
  pgrep -x Xorg >/dev/null || startx
fi
