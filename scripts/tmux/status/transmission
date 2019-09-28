#! /bin/bash

if [[ $1 = "--help" ]] || [[ $1 = "help" ]]; then
  echo "$ transmission-status"
  echo "Get the number of running torrents"
  exit
fi

# transmission-remote -l 2> /dev/null | egrep "(Downloading)|(Idle)" | fgrep -v 100% | wc -l
# too cpu intensive

ps -ux | grep "transmission-daemon" | grep -v grep && echo " tsm " || exit 1
