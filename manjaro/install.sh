BASE=https://raw.githubusercontent.com/jneidel/dotfiles/master;
LINUX=$BASE"/manjaro";
SCRIPTS=$LINUX"/install-scripts"

function prompt() {
  read -p 'Install '$1'? (Y/n): ' ans

  if [ -z $ans ] || [ $ans = y ] || [ $ans = Y ]
  then
    $2
  fi
}

prompt 'zsh' 'sh -c "$( curl -fsSL $SCRIPTS'/zsh.sh' )"'
prompt 'configurations' 'sh -c "$( curl -fsSL $SCRIPTS'/configs.sh' )"'
prompt 'node' 'sh -c "$( curl -fsSL $SCRIPTS'/node.sh' )"'

prompt 'npm-apps' 'npm install -g ava concurrently dict-cc-cli eslint fkill-cli markdown-toc nodemon np npm-name-cli tslide yo'

prompt 'optimize pacman' 'sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu'

prompt 'install packer' 'yaourt -S packer-aur'

prompt 'system-update' 'sudo packer-aur -Syu'
prompt 'pacman/aur-apps' 'packer-aur -S cmus fd keepassxc terminator vlc zeal gdb htop tmux unzip xorg-xmodmap zsh-syntax-highlighting bluez-utils zip xflux arandr arc-gtk-theme rofi mosh python-pip gcc beets manjaro-pulse pulseaudio pulsemixer pulseaudio-bluetooth sxiv gwenview'

# Specific case apps
prompt 'firefox' 'packer-aur -S firefox-nightly'
prompt 'chrome' 'packer-aur -S chromium chromium-widevine'
prompt 'gimp' 'packer-aur -S gimp'

prompt 'pip apps' 'sudo pip install grip'

prompt 'pac remove' 'sudo pacman -Rsn hexchat'

prompt 'pia' 'sh -c "$( curl -fsSL $SCRIPTS'/pia.sh' )"'
prompt 'gpg1' 'sh -c "$( curl -fsSL $SCRIPTS'/gpg1.sh' )"'
prompt 'ytdl' 'sh -c "$( curl -fsSL $SCRIPTS'/ytdl.sh' )"'
prompt 'webtorrent' 'sh -c "$( curl -fsSL $SCRIPTS'/webtorrent.sh' )"'
prompt 'ssh-keys' 'sh -c "$( curl -fsSL $SCRIPTS'/ssh-keys.sh' )"'
prompt 'dict-cc-dump' 'sh -c "$( curl -fsSL $SCRIPTS'/dict-cc.sh' )"'
prompt 'zeal-docsets' 'sh -c "$( curl -fsSL $SCRIPTS'/zeal.sh' )"'
prompt 'vsc-extensions' 'sh -c "$( curl -fsSL $SCRIPTS'/vsc.sh' )"'
prompt 'yacreader' 'sh -c "$( curl -fsSL $SCRIPTS'/yacreader.sh' )"'
prompt 'mongodb' 'sh -c "$( curl -fsSL $SCRIPTS'/mongodb.sh' )"'
prompt 'fonts' 'sh -c "$( curl -fsSL $SCRIPTS'/fonts.sh' )"'
prompt 'keepass' 'sh -c "$( curl -fsSL $SCRIPTS'/keepass.sh' )"'
prompt 'pip' 'sh -c "$( curl -fsSL $SCRIPTS'/pip.sh' )"'

prompt 'alsamixer' 'alsamixer'

# Manual:
# - chsh
# - get main.kdbx

