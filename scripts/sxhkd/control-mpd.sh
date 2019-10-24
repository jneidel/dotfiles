#! /bin/sh

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ control-mpd.sh <++>
<++>

Parameters:
  \$1: <++>
  [\$1]: <++>

Example:
  $ control-mpd.sh <++>
"
  exit
fi

command -v mpcc >/dev/null || { echo "mpcc script is not in PATH"; exit 1; }

# notify-send ok
mpcc toggle

