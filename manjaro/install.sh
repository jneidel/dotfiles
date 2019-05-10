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

prompt 'zsh' 'sh -c "$( curl -fsSL $SCRIPTS\"/zsh.sh\" )"'
prompt 'configurations' 'sh -c "$( curl -fsSL $SCRIPTS\"/configs.sh\" )"'

# Pacman
prompt 'optimize pacman' 'sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu'
prompt 'packer' 'yaourt -S packer-aur-git'

prompt 'system-update' 'sudo packer-aur -Syu'
prompt 'pacman gui apps' 'sudo packer-aur -S keepassxc kitty vlc zeal tmux gwenview apvlv sxiv firefox-nightly chromium chromium-widevine surf bleachbit kid3 fbreader gcolor2 conky rofi'
prompt 'pacman tui apps' 'sudo packer-aur -S cmus htop mosh pulsemixer sent taskell-bin calcurse ranger transmission-remote-cli-git'
prompt 'pacman clis' 'sudo packer-aur -S figlet figlet-fonts fd pjson entr python-grip task-spooler ffsend-bin megacmd-bin mullvad-vpn neofetch tmate transmission-cli exa bat'
prompt 'pacman utilities' 'sudo packer-aur -S gdb xorg-xmodmap zsh-syntax-highlighting zip unzip bluez-utils arc-gtk-theme python-pip gcc xflux arandr networkmanager-dmenu-git farbfeld par ttf-emojione volumeicon'
prompt 'pacman programming' 'sudo packer-aur -S docker docker-compose jq mongodb ngrok'
prompt 'sound' 'alsa-utils pulseaudio-alsa manjaro-pulse pulseaudio pulseaudio-bluetooth'

# NPM
prompt 'node' 'sudo packer-aur -S nodejs npm'
prompt 'npm non programming clis' 'sudo npm install -g dict-cc-cli tslide mangareader-dl fkill-cli'
prompt 'npm programming clis' 'sudo npm install -g ava eslint np yo typescript webpack webpack-cli generator-jneidel fx'
prompt 'npm programming utilities' 'sudo npm install -g concurrently markdown-toc nodemon npm-name-cli browser-sync npm-check-updates prettier eslint_d'
prompt 'npm eslint configs' 'sudo npm install -g eslint-config-xo eslint-plugin-node eslint-plugin-unicorn'
prompt 'npm eslint-ts specific configs' 'sudo npm install -g eslint-config-xo-typescript @typescript-eslint/parser @typescript-eslint/eslint-plugin'

# Specific case apps
prompt 'gimp' 'packer-aur -S gimp'
#prompt 'yacreader' 'packer-aur -S yacreader-nopdf'
prompt 'beets' 'sudo packer-aur -S beets python-beautifulsoup4 python-requests mutagen-tools' # python modules for the lyrics/cover-art plugin
prompt 'mplayer' 'sudo packer-aur -S mplayer' # cli player
prompt 'newsboat' 'sudo packer-aur -S newsboat'
prompt 'wine' 'sudo packer-aur -S wine wine-mono'
prompt 'xorg' 'sudo packer-aur -S xautolock xorg-server xorg-xev xorg-xrandr xclip oblogout-blurlock'

prompt 'rclone (skip for beta, as it will be asked next)' 'sudo packer-aur -S rclone'
prompt 'rclone-beta' 'curl https://rclone.org/install.sh | sudo bash -s beta'

prompt 'pacman remove' 'sudo pacman -Rsn hexchat'

prompt 'ytdl' 'sh -c "$( curl -fsSL $SCRIPTS'/ytdl.sh' )"'
prompt 'webtorrent' 'sh -c "$( curl -fsSL $SCRIPTS'/webtorrent.sh' )"'
prompt 'ssh-keys' 'sh -c "$( curl -fsSL $SCRIPTS'/ssh-keys.sh' )"'
prompt 'dict-cc-dump' 'sh -c "$( curl -fsSL $SCRIPTS'/dict-cc.sh' )"'
prompt 'zeal-docsets' 'sh -c "$( curl -fsSL $SCRIPTS'/zeal.sh' )"'
#prompt 'vsc-extensions' 'sh -c "$( curl -fsSL $SCRIPTS'/vsc.sh' )"'
prompt 'mongodb' 'sh -c "$( curl -fsSL $SCRIPTS'/mongodb.sh' )"'
prompt 'fonts' 'sh -c "$( curl -fsSL $SCRIPTS'/fonts.sh' )"'
prompt 'keepass' 'sh -c "$( curl -fsSL $SCRIPTS'/keepass.sh' )"'
#prompt 'pip' 'sh -c "$( curl -fsSL $SCRIPTS'/pip.sh' )"'

#prompt 'alsamixer' 'alsamixer'

# Manual:
# - chsh
# - get main.kdbx

