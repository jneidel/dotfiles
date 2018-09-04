cmus-remote -r;

status=$(cmus-remote -Q | grep "status" | cut -d ' ' -f 2)
if [ $status == "playing" ]; then
  cur=$(~/.tmux/cmus)
  notify-send "cmus: $cur" -t 800
else
  notify-send "cmus: previous" -t 800 -u low
fi

