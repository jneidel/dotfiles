#! /bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ pi.sh
Install dotfiles for a raspberry pi
"; exit
fi

echo "Copy scripts"
mkdir -p ~/scripts
cd $DIR/../scripts
cp mount/mo mpd/ncmpcpps mpd/send-cover ~/scripts

echo "Copy zshrc"
cd $DIR/..
mkdir -p ~/.zsh ~/.z
cp -r .zsh/oh-my-zsh.sh .zsh/lib .zsh/cobalt2.zsh-theme ~/.zsh/
cp other/pi-zshrc ~/.zshrc
sed -i "s|\$\" # CHANGE PROMPT HERE|pi\"|" ~/.zsh/cobalt2.zsh-theme

echo "Copy mpd configs"
cd $DIR/..
mkdir -p ~/.config/ncmpcpp
cp other/pi-mpd.conf /etc/mpd.conf
cp .config/ncmpcpp/config .config/ncmpcpp/bindings ~/.config/ncmpcpp/

