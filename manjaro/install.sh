BASE=https://raw.githubusercontent.com/jneidel/dotfiles/master/;
LINUX=$BASE"manjaro/";

sh -c "$( curl -fsSL $LINUX'scripts/zsh.sh' )";
sh -c "$( curl -fsSL $LINUX'scripts/configs.sh' )";
sh -c "$( curl -fsSL $LINUX'scripts/node.sh' )";

npm install -g ava concurrently dict-cc-cli eslint fkill-cli markdown-toc nodemon np npm-name-cli tslide yo;

sudo pacman -Syu;
sudo pacman -S cmus fd chromium keepassxc gimp lynx terminator vlc zeal gdb htop tmux unzip xorg-xmodmap zsh-syntax-highlighting;

yaourt -S visual-studio-code-bin;

sh -c "$( curl -fsSL $LINUX'scripts/pia.sh' )";
sh -c "$( curl -fsSL $LINUX'scripts/gpg1.sh' )";
sh -c "$( curl -fsSL $LINUX'scripts/ytdl.sh' )";
sh -c "$( curl -fsSL $LINUX'scripts/webtorrent.sh' )";
sh -c "$( curl -fsSL $LINUX'scripts/ssh-keys.sh' )";
sh -c "$( curl -fsSL $LINUX'scripts/dict-cc.sh' )";

sh -c "$( curl -fsSL $LINUX'scripts/zeal.sh' )";
sh -c "$( curl -fsSL $LINUX'scripts/vsc.sh' )";

echo "zsh path:";
which zsh;
chsh;

alsamixer;

# Manual:
# - get main.kdbx

