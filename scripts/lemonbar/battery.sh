#! /bin/sh

if [ "$1" = "--help" ] || [ "$1" = "help" ]; then
  echo "$ battery"
  echo "Print current battery charge"
  exit
fi

POWER=/sys/class/power_supply

[ -f $POWER/BAT1/charge_now ] && { # x240
  CHARGE=$POWER/BAT1/energy_now
  CAPACITY=$POWER/BAT1/energy_full
  AC=$POWER/AC/online
} || { # e495
  CHARGE=$POWER/BAT0/energy_now
  CAPACITY=$POWER/BAT0/energy_full
  AC=$POWER/AC/online
}

PERCENT=$(python -c "print($(cat $CHARGE)/$(cat $CAPACITY)*100)" | cut -d "." -f1)
PERCENT_ICON=$(
  if [ "$PERCENT" -gt 95 ] && [ "$PERCENT" -le 105 ]; then
      echo " "
  elif [ "$PERCENT" -gt 90 ] && [ "$PERCENT" -le 95 ]; then
      echo " "
  elif [ "$PERCENT" -gt 80 ] && [ "$PERCENT" -le 90 ]; then
      echo " "
  elif [ "$PERCENT" -gt 65 ] && [ "$PERCENT" -le 80 ]; then
      echo " "
  elif [ "$PERCENT" -gt 55 ] && [ "$PERCENT" -le 65 ]; then
      echo " "
  elif [ "$PERCENT" -gt 42 ] && [ "$PERCENT" -le 55 ]; then
      echo " "
  elif [ "$PERCENT" -gt 35 ] && [ "$PERCENT" -le 42 ]; then
      echo " "
  elif [ "$PERCENT" -gt 30 ] && [ "$PERCENT" -le 35 ]; then
      echo " "
  elif [ "$PERCENT" -gt 15 ] && [ "$PERCENT" -le 30 ]; then
      echo " "
  elif [ "$PERCENT" -ge 5 ] && [ "$PERCENT" -le 15 ]; then
      echo " "
  elif [ "$PERCENT" -ge 0 ] && [ "$PERCENT" -le 5 ]; then
      echo " "
  fi
)

IS_CHARGING=$(cat $AC)
CHARGING_ICON=$([ "$IS_CHARGING" -eq 1 ] && echo "")

echo "$CHARGING_ICON$PERCENT_ICON$PERCENT%"

