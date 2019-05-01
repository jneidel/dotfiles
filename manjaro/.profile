# ~/.profile
# run at startup

## Language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

## Paths
export PATH=~/.bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin
export PATH="$(du $HOME/scripts/ | cut -f2 | fgrep -v -f ~/scripts/scripts-path-filter-pattern | tr '\n' ':')$PATH"
export CDPATH=.:~:~/code:~/Downloads:~/ct

## Applications
export EDITOR=vim
export PAGER=less
export BROWSER=firefox-nightly
export B=$BROWSER
export ALT_BROWSER=chromium

### Application options
export FZF_DEFAULT_OPTS="--height 50% --no-mouse --ansi --color=16"

## User specific
export KEYID=B29E6A7A7DFD16FA # GPG keyid

## Manjaro defaults
### GUI related
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

if [ -n "$GTK_MODULES" ]
then
    GTK_MODULES="$GTK_MODULES:unity-gtk-module"
else
  GTK_MODULES="unity-gtk-module"
fi

if [ -z "$UBUNTU_MENUPROXY" ]
then
  UBUNTU_MENUPROXY=1
fi

### X related
export XAUTHORITY=~/.Xauthority
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

