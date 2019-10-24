#! /bin/sh

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ bt-watchdog.sh
Send a notification when connected to a new bluetooth device.
"
  exit
fi

command -v journalctl >/dev/null || { echo "journalctl is not installed"; exit 1; }

journalctl -u bluetooth -f -o cat | while read -r line; do
  if echo $line | fgrep " ready" >/dev/null; then
    DEV="$(btdevice)"
    notify-send "Bluetooth Connected" "$DEV" -i bluetooth -t 2000 -u low
  fi
done
