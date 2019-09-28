#! /bin/sh

if [ "$1" = "--help" ] || [ "$1" = "help" ]; then
  echo "$ bluetooth"
  echo "Print name of currently connected bluetooth device"
  exit
fi

DEVICE="$(~/scripts/bluetooth/btdevice)"

[ -n "$DEVICE" ] && echo "$DEVICE" | cut -d "-" -f 2- | awk '{ print "  "$0" " }'

