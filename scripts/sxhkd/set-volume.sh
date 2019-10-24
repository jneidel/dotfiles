#! /bin/sh

MAX_VOL=130

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ set-volume.sh <command>
Set the volume and send a notification.

Commands:
  mute: toggle mute
  +<n>: raise volume
  -<n>: lower volume

Example:
  $ set-volume.sh +5
  $ set-volume.sh -5
  $ set-volume.sh mute
"
  exit
fi

command -v pulsemixer >/dev/null || { echo "pulsemixer is not installed"; exit 1; }

COMMAND="$1"

if [ "$COMMAND" = "mute" ]; then
  pulsemixer --toggle-mute
elif [ ! "$(($(pulsemixer --get-volume | cut -d\  -f1) $COMMAND))" -gt "$MAX_VOL" ]; then
  pulsemixer --change-volume $COMMAND
fi

MUTE=$(pulsemixer --get-mute)
VOL=$(pulsemixer --get-volume | cut -d\  -f1)

if [ "$MUTE" -eq 1 ]; then
  ICON="mute"
  HEAD="Volume Muted"
else
  if [ "$VOL" -lt 5 ]; then
    ICON="volume-none"
  elif [ "$VOL" -lt 50 ]; then
    ICON="volume-less"
  else
    ICON="volume-more"
  fi

  VOL_PERCENT=$((VOL*100/MAX_VOL))

  HEAD="Volume: $VOL_PERCENT%"
  BODY="$(get-progress-string.sh 28 '▪' ' ' $VOL_PERCENT)"
fi

notify-send -i $ICON -h string:x-canonical-private-synchronous:volume -u normal -t 1000 "$HEAD" "$BODY"

