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

# Pacman
prompt 'optimize pacman' 'sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu'
prompt 'packer' 'yaourt -S packer-aur'

prompt 'system-update' 'sudo packer-aur -Syu'
prompt 'pacman gui apps' 'packer-aur -S keepassxc terminator vlc zeal tmux gwenview apvlv sxiv firefox-nightly chromium chromium-widevine'
prompt 'pacman tui apps' 'packer-aur -S cmus htop mosh beets pulsemixer'
prompt 'pacman clis' 'packer-aur -S figlet fd pjson entr python-grip'
prompt 'pacman utilities' 'packer-aur -S gdb xorg-xmodmap zsh-syntax-highlighting zip unzip bluez-utils arc-gtk-theme python-pip gcc rofi xflux arandr manjaro-pulse pulseaudio pulseaudio-bluetooth python-requests jq'

# NPM
prompt 'node' 'pacman -S nodejs'
prompt 'npm non programming clis' 'sudo npm install -g dict-cc-cli tslide mangareader-dl fkill-cli'
prompt 'npm programming clis' 'sudo npm install -g ava eslint np yo typescript webpack webpack-cli generator-jneidel'
prompt 'npm programming utilities' 'sudo npm install -g concurrently markdown-toc nodemon npm-name-cli browser-sync npm-check-updates'
prompt 'npm eslint configs' 'sudo npm install -g eslint-config-xo eslint-plugin-ava eslint-plugin-node eslint-plugin-unicorn eslint-plugin-json typescript-eslint-parser eslint-config-xo-typescript eslint-plugin-typescript'

# Specific case apps
prompt 'gimp' 'packer-aur -S gimp'

prompt 'pacman remove' 'sudo pacman -Rsn hexchat'

prompt 'pia' 'sh -c "$( curl -fsSL $SCRIPTS'/pia.sh' )"'
#prompt 'gpg1' 'sh -c "$( curl -fsSL $SCRIPTS'/gpg1.sh' )"'
prompt 'ytdl' 'sh -c "$( curl -fsSL $SCRIPTS'/ytdl.sh' )"'
prompt 'webtorrent' 'sh -c "$( curl -fsSL $SCRIPTS'/webtorrent.sh' )"'
prompt 'ssh-keys' 'sh -c "$( curl -fsSL $SCRIPTS'/ssh-keys.sh' )"'
prompt 'dict-cc-dump' 'sh -c "$( curl -fsSL $SCRIPTS'/dict-cc.sh' )"'
prompt 'zeal-docsets' 'sh -c "$( curl -fsSL $SCRIPTS'/zeal.sh' )"'
#prompt 'vsc-extensions' 'sh -c "$( curl -fsSL $SCRIPTS'/vsc.sh' )"'
prompt 'yacreader' 'sh -c "$( curl -fsSL $SCRIPTS'/yacreader.sh' )"'
prompt 'mongodb' 'sh -c "$( curl -fsSL $SCRIPTS'/mongodb.sh' )"'
prompt 'fonts' 'sh -c "$( curl -fsSL $SCRIPTS'/fonts.sh' )"'
prompt 'keepass' 'sh -c "$( curl -fsSL $SCRIPTS'/keepass.sh' )"'
#prompt 'pip' 'sh -c "$( curl -fsSL $SCRIPTS'/pip.sh' )"'

#prompt 'alsamixer' 'alsamixer'

# Manual:
# - chsh
# - get main.kdbx

