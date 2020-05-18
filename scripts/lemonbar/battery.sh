#! /bin/sh

if [ "$1" = "--help" ] || [ "$1" = "help" ]; then
  echo "$ battery"
  echo "Print current battery charge"
  exit
fi

POWER=/sys/class/power_supply

[ -f $POWER/BAT1/energy_now ] && { # x240
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
  if [ "$PERCENT" -gt 96 ] && [ "$PERCENT" -le 105 ]; then
      echo " "
  elif [ "$PERCENT" -gt 91 ] && [ "$PERCENT" -le 96 ]; then
      echo " "
  elif [ "$PERCENT" -gt 86 ] && [ "$PERCENT" -le 91 ]; then
      echo " "
  elif [ "$PERCENT" -gt 70 ] && [ "$PERCENT" -le 86 ]; then
      echo " "
  elif [ "$PERCENT" -gt 59 ] && [ "$PERCENT" -le 70 ]; then
      echo " "
  elif [ "$PERCENT" -gt 49 ] && [ "$PERCENT" -le 59 ]; then
      echo " "
  elif [ "$PERCENT" -gt 40 ] && [ "$PERCENT" -le 49 ]; then
      echo " "
  elif [ "$PERCENT" -gt 31 ] && [ "$PERCENT" -le 40 ]; then
      echo " "
  elif [ "$PERCENT" -gt 11 ] && [ "$PERCENT" -le 31 ]; then
      echo " "
  elif [ "$PERCENT" -ge 6 ] && [ "$PERCENT" -le 11 ]; then
      echo " "
  elif [ "$PERCENT" -ge 0 ] && [ "$PERCENT" -le 6 ]; then
      echo " "
  fi
)

IS_CHARGING=$(cat $AC)
CHARGING_ICON=$([ "$IS_CHARGING" -eq 1 ] && echo "")

echo "${CHARGING_ICON}${PERCENT_ICON}${PERCENT}%"

