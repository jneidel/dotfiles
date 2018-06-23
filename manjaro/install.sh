BASE=https://raw.githubusercontent.com/jneidel/dotfiles/master/;
LINUX=$BASE"manjaro/";

function prompt() {
  read -p 'Install '$1'? (Y/n): ' ans

  if [ -z $ans ] || [ $ans = y ] || [ $ans = Y ]
  then
    $2
  fi
}

prompt 'zsh' 'sh -c "$( curl -fsSL $LINUX'scripts/zsh.sh' )"'
prompt 'configurations' 'sh -c "$( curl -fsSL $LINUX'scripts/configs.sh' )"'
prompt 'node' 'sh -c "$( curl -fsSL $LINUX'scripts/node.sh' )"'

prompt 'npm-apps' 'npm install -g ava concurrently dict-cc-cli eslint fkill-cli markdown-toc nodemon np npm-name-cli tslide yo'

prompt 'system-update' 'sudo pacman -Syu'
prompt 'pacman-apps' 'sudo pacman -S cmus fd chromium keepassxc gimp lynx terminator vlc zeal gdb htop tmux unzip xorg-xmodmap zsh-syntax-highlighting'

prompt 'yaourt-apps' 'yaourt -S visual-studio-code-bin'

prompt 'pia' 'sh -c "$( curl -fsSL $LINUX'scripts/pia.sh' )"'
prompt 'gpg1' 'sh -c "$( curl -fsSL $LINUX'scripts/gpg1.sh' )"'
prompt 'ytdl' 'sh -c "$( curl -fsSL $LINUX'scripts/ytdl.sh' )"'
prompt 'webtorrent' 'sh -c "$( curl -fsSL $LINUX'scripts/webtorrent.sh' )"'
prompt 'ssh-keys' 'sh -c "$( curl -fsSL $LINUX'scripts/ssh-keys.sh' )"'
prompt 'dict-cc-dump' 'sh -c "$( curl -fsSL $LINUX'scripts/dict-cc.sh' )"'
prompt 'zeal-docsets' 'sh -c "$( curl -fsSL $LINUX'scripts/zeal.sh' )"'
prompt 'vsc-extensions' 'sh -c "$( curl -fsSL $LINUX'scripts/vsc.sh' )"'
prompt 'yacreader' 'sh -c "$( curl -fsSL $LINUX'scripts/yacreader.sh' )"'

prompt 'alsamixer' 'alsamixer'

# Manual:
# - chsh
# - get main.kdbx

