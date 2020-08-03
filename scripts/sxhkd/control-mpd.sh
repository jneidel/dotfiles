#! /bin/sh

# refactor mpd stuff into separate mpdctl?
# rename to control media?

TMP=/tmp/control-mpd-tmp

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ control-mpd.sh COMMAND
Send commands to mpd and send a notification on it.
For usage via keyboard shortcuts (sxhkd).

Commands:
  toggle: pause/play music
  next: next track
  prev: previous track

Example:
  $ control-mpd.sh toggle
"
  exit
fi

command -v mpcc >/dev/null || { echo "mpcc script is not in PATH"; exit 1; }

run_cmd() {
  CMD="$1"

  mpcc $CMD -f 'TRACK:%title% - %artist%\nFILE:%file%' > $TMP

  TRACK="$(grep -Po '^TRACK:\K.*' $TMP)"
  [ "$TRACK" = " - " ] && {
    TRACK="$(basename "$(grep -Po '^FILE:\K.*' $TMP)" | rev | cut -d. -f2 | rev)"
  }

  if [ "$CMD" = "toggle" ]; then
    if grep "^\[playing" $TMP; then
      ICON=player_play
      HEAD=Play
    else
      ICON=player_pause
      HEAD=Pause
    fi
  fi

  notify-send -i $ICON -h string:x-canonical-private-synchronous:controlMpd -u normal -t 7000 "$HEAD" "$TRACK"
}

IS_MPD=0
MPV_PAUSE="$(mpvctl get pause 2>/dev/null)"
if [ "$?" -eq 0 ] && [ "$MPV_PAUSE" = "false" ]; then
  IS_MPD=1
fi

case $1 in
  toggle)
    if [ "$IS_MPD" -eq 1 ]; then
      mpvctl toggle
    else
      run_cmd toggle
    fi;;
  next)
    if [ "$IS_MPD" -eq 1 ]; then
      mpvctl seek 60
    else
      ICON=player_end
      HEAD=Next
      run_cmd next
    fi;;
  prev)
    if [ "$IS_MPD" -eq 1 ]; then
      mpvctl seek -60
    else
      ICON=player_start
      HEAD=Previous
      run_cmd prev
    fi;;
  *) echo "Please pass either 'toggle', 'next' or 'prev'";;
esac

