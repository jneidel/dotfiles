#! /bin/sh

if [ "$1" = "--help" ] || [ "$1" = "help" ]; then
  echo "$ bluetooth"
  echo "Print name of currently connected bluetooth device"
  exit
fi

DEVICE="$(~/scripts/bluetooth/btdevice)"

if [ -n "$DEVICE" ]; then
  echo "$DEVICE" | sed 's/jneidel-//; s/charge-//' | awk '{ print "  "$0" " }'
fi
