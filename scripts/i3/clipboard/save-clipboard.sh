#! /bin/bash

if [[ $1 = "--help" ]] || [[ $1 = "help" ]]; then
  echo "$ save-clipboard.sh"
  echo "Save clipboard content to ~/tmp/clip"
fi

CLIP=$(clipit -c 2>/dev/null)

echo $CLIP >> ~/tmp/clip
notify-send "Clipboard saved" -t 800

