#! /bin/sh

DIR=~/.config/transmission-daemon
RPC_FILE=$DIR/rpc-password

if [ "$1" = "--help" ] || [ "$1" = "help" ]; then
  echo "$ set-rpc-password.sh"
  echo "Save the rpc-password to a local file"
  exit
fi

[ -e "$RPC_FILE" ] && sed -i "s|rpc-password\": \".*\"|rpc-password\": \"$(cat $RPC_FILE)\"|" $DIR/settings.json || echo "no $RPC_FILE found"

