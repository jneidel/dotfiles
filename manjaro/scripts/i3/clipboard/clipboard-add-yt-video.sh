#! /bin/bash

if [[ $1 = "--help" ]] || [[ $1 = "help" ]]; then
  echo "$ clipboard-add-yt-video.sh "
  echo "Adds current clipboard content to youtube-locals videos"
  exit
fi

CLIP=$(clipit -c 2>/dev/null)
notify-send "Added clipboard to videos" -t 800
~/scripts/yt/bin/add-video.sh "$CLIP"

