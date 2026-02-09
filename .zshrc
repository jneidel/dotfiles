# Zsh config

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_DATA_HOME:-$HOME/.local/state}"
export XDG_CONFIG_RC="${XDG_DATA_HOME}"

# export XDG_ZI_HOME=${XDG_DATA_HOME}/zi
# export ${ZI[HOME_DIR]}=$XDG_ZI_HOME
# if [ ! -d "$XDG_ZI_HOME/bin" ]; then
#   mkdir -p "$XDG_ZI_HOME"
#   git clone https://github.com/z-shell/zi.git $XDG_ZI_HOME/bin
# fi
# typeset -A ZI
# source "$XDG_ZI_HOME/bin/zi.zsh"
# autoload -Uz _zi
# (( ${+_comps} )) && _comps[zi]=_zi

# oh-my-zsh
ZSH_DIR=~/.zsh
source $ZSH_DIR/oh-my-zsh.sh
source $ZSH_DIR/lib/init.zsh
source $ZSH_DIR/cobalt2.zsh-theme

test -e "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" &&
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
test -e "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" &&
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# installed with pacman: zsh-syntax-highlighting[-git]

# bindkey -v # shell vim mode
bindkey -e # emacs mode
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
export PATH=$HOME/.local/bin:/usr/local/bin:$HOME/.rd/bin:/bin:/usr/bin:/usr/bin/vendor_perl:/usr/sbin:/usr/bin/site_perl:$HOME/.cargo/bin:$HOME/.local/share/nix/profile/bin:$(ls -d ~/.local/share/gem/ruby/*/bin | tr '\n' ':')
export PATH="$(du $HOME/scripts/ | cut -f2 | grep -Fve .git -e node_modules -e lib -e data | tr '\n' ':')$PATH"
export CDPATH=.:~:~/code:~/Downloads:~/org:~/org/1_design:~/org/2_project:~/org/3_areas:~/org/4_resources:~/org/4_resources/media:~/scripts:~/.config:~/code/notes:~/.local/org

## Applications
export EDITOR=vim
export PAGER=less
export LESS="-R"
export BROWSER=nyxt
export B=$BROWSER
export ALT_BROWSER=firefox-developer-edition
# for eslint, see: https://github.com/eslint/eslint/issues/11914#issuecomment-525498682

### Themes
export GTK_THEME=Arc

## User specific
export WEB_HOME=$HOME/code/web
export WEB_SESSION_NAME=web
export WEB_NOTES=$ORG_AREAS/blog/posts

test -f "$HOME/.config/broot/launcher/bash/br" && source $HOME/.config/broot/launcher/bash/br

zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

# kitty shell integration
test -e "/usr/lib/kitty/shell-integration/kitty.zsh" && source "/usr/lib/kitty/shell-integration/kitty.zsh"

# macos
if [ "$(uname)" = "Darwin" ]; then
  # overwrite bsd utils with gnu ones, so I don't have to fix my scripts on every change
  # $ brew install coreutils gnu-sed findutils
  gnu_overwrite_paths="$(find /usr/local/opt/*/libexec/gnubin -type d | tr '\n' ':')"
  if [ -n "$gnu_overwrite_paths" ]; then
    export PATH="${gnu_overwrite_paths}${PATH}"
  fi
fi

# Import aliases
source $ZSH_DIR/init.zsh

# fpath+=( $ZSH_DIR/functions )
# autoload -Uz tp

# start xorg on first login into the tty
# runs commands in ~/.xinitrc
if [ "$(tty)" = "/dev/tty1" ]; then
  pgrep -x Xorg >/dev/null || startx -- -dpi 120 -ardelay 185 -arinterval 10 # rate only applies on startup
fi
