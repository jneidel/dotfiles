#! /bin/sh

SCRIPT=~/scripts/weather/toggle-location

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ update-location.sh
Update the location using $SCRIPT
To be run via cron
"; exit
fi

~/scripts/cron/cron-notify-send "Updating location" "$($SCRIPT)"
