#! /bin/sh

LIB=~/scripts/watchdogs/watchdog-lib.sh
[ ! -e "$LIB" ] && { echo "watchdog lib file not found"; exit 1; }
. $LIB

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ keyboard-watchdog.sh
Run the 'setup-keys' script when a keyboard device gets plugged in.
"; exit
fi

command -v journalctl >/dev/null || { echo "journalctl is not installed"; exit 1; }
command -v setup-keys >/dev/null || { echo "<++> is not installed"; exit 1; }

journalctl -fo cat -k --since=now | fgrep "input: Apple Inc." --line-buffered | while read -r line; do
  # only exec every 2nd time, as the same line comes 2 times
  INPUT_DEV_NUM="$(echo $line | grep -Po '\d+$')"
  if [ `expr "$INPUT_DEV_NUM" % 2` -eq 0 ]; then
    setup-keys
    notify "setup-keys"
  fi
done
