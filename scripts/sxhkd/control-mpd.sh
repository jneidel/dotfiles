#! /bin/sh

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ control-mpd.sh <command>
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
command -v mpc-get >/dev/null || { echo "mpc-get script is not in PATH"; exit 1; }
command -v is-mpd-playing >/dev/null || { echo "is-mpd-playing script is not in PATH"; exit 1; }

mpcc_exec() {
  mpcc $1 > /dev/null
}

notification() {
  # $1 icon
  # $2 head

  TRACK="$(mpc-get '%title% - %artist%')"
  [ "$TRACK" = " - " ] && {
    TRACK="basename '$(mpc-get file)'"
  }

  notify-send -i $1 -h string:x-canonical-private-synchronous:controlMpd -u normal -t 7000 "$2" "$TRACK"
}

toggle() {
  if is-mpd-playing; then
    notification player_pause "Pause" &
  else
    notification player_play "Play" &
  fi

  mpcc_exec toggle
}

next() {
  notification player_end "Next" &
  mpcc_exec next
}

prev() {
  notification player_start "Previous" &
  mpcc_exec prev
}
case $1 in
  toggle) toggle;;
  next) next;;
  prev) prev;;
  *) echo "Please pass either 'toggle', 'next' or 'prev'";;
esac

