#! /bin/sh

LIB=~/scripts/watchdogs/watchdog-lib.sh
[ ! -e "$LIB" ] && { echo "watchdog lib file not found"; exit 1; }
. $LIB

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ bt-watchdog.sh
Send a notification when connected to a new bluetooth device.
"
  exit
fi

command -v journalctl >/dev/null || { echo "journalctl is not installed"; exit 1; }

cb() {
  line="$1"

  if echo $line | fgrep " ready" >/dev/null; then
    DEV="$(btdevice)"
    notify "Bluetooth Connected" "$DEV" -i bluetooth
  fi
}

readJournal bluetooth cb
