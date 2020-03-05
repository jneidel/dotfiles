#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ watchdoggos.sh
Run watchdogs in this directory matching this pattern:
*-watchdog.sh
"; exit
fi

sh $DIR/keyboard-watchdog.sh
sh $DIR/bt-watchdog.sh
sh $DIR/battery-watchdog.sh
