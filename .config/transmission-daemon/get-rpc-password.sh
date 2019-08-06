#! /bin/sh

DIR=~/.config/transmission-daemon
RPC_FILE=$DIR/rpc-password

if [ "$1" = "--help" ] || [ "$1" = "help" ]; then
  echo "$ get-rpc-password.sh"
  echo "Save the rpc-password to a local file"
  exit
fi

cat $DIR/settings.json | grep --color=auto rpc-password | cut -d\" -f 4 > $RPC_FILE

