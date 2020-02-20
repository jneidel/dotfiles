#! /bin/sh

REPO=~/code/todos

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ update-todos.sh
Update $REPO via cron
"; exit
fi

~/scripts/cron/cron-notify-send "Updating todos"
$REPO/get-todos.sh

