cmus-remote -u;

status=$(cmus-remote -Q | grep "status" | cut -d ' ' -f 2)
if [ $status == "playing" ]; then
  cur=$(~/.tmux/cmus)
  notify-send "cmus: $cur" -t 800
else
  notify-send "cmus: pause" -t 800 -u low
fi

