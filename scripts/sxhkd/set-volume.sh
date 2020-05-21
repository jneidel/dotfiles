#! /bin/sh

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ] || [ -z "$1" ]; then
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

get_active_sink() {
  if RUNNING_SINKS="$(pactl list sinks short | fgrep 'RUNNING')"; then
    echo $RUNNING_SINKS | tail -n1 | awk '{ print $1 }'
  else
    echo 0
    # "@DEFAULT_SINK@"
  fi
}
SINK="$(get_active_sink)"

case "$COMMAND" in
  mute) pactl set-sink-mute "$SINK" toggle ;;
  +*|-*) pactl set-sink-volume "$SINK" "${COMMAND}%" ;;
  *) echo Invalid command, see --help ;;
esac

notification() {
  PROPS="$(pactl list sinks | fgrep "Sink #$SINK" -A 32)"

  MUTE=$(echo $PROPS | fgrep "Mute: no" >/dev/null && echo 0 || echo 1)

  VOL="$(echo $PROPS | grep -Po '\d+%' )"
  VOL="$(echo $VOL | awk -F % '{print $1}' )"

  echo mute: $MUTE, vol: $VOL

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

    HEAD="Volume: $VOL%"
    BODY="$(get-progress-string.sh 28 '▪' ' ' $VOL)"
  fi

  notify-send -i $ICON -h string:x-canonical-private-synchronous:volume -u normal -t 1000 "$HEAD" "$BODY"
}
notification

# MPD=~/scripts/mpd
# if [ "$(cat $MPD/mpd-server-status)" -gt 0 ]; then
#   if $MPD/is-mpd-playing; then # nested for performance
#     echo ok # control mpd server instead of local volume as long as music is playing
#   fi
# fi

