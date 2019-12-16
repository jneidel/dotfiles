#! /bin/sh

# Todo: differentiate between notifications if power is connected
# check: https://wiki.archlinux.org/index.php/laptop#Battery_state

LIB=~/scripts/watchdogs/watchdog-lib.sh
[ ! -e "$LIB" ] && { echo "watchdog lib file not found"; exit 1; }
. $LIB

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ bt-watchdog.sh
Send a notification when connected to a new bluetooth device.
"
  exit
fi

POWER=/sys/class/power_supply

[ -f $POWER/BAT0/charge_now ] && { # macbook
  CHARGE=$POWER/BAT0/charge_now
  CAPACITY=$POWER/BAT0/charge_full
  AC=$POWER/ADP1/online
} || { # thinkpad
  CHARGE=$POWER/BAT1/energy_now
  CAPACITY=$POWER/BAT1/energy_full
  AC=$POWER/AC/online
}

while true; do
  PERCENT=$(node -e "console.log(($(cat $CHARGE)/$(cat $CAPACITY)*100).toFixed(0))")

  case $PERCENT in
    100|60|40|20|5) notify "Battery at $PERCENT%";;
    3)
      notify-send "Battery at $PERCENT%" "Suspending in 10s" -u critical -t 10000
      sleep 10
      suspend
      ;;
  esac

  sleep 180
done


