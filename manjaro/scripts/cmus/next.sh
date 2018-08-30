cmus-remote -n;

status=$(cmus-remote -Q | grep "status" | cut -d ' ' -f 2)
if [ $status == "playing" ]; then
  notify-send "cmus: $(~/.tmux/cmus)";
else
  notify-send "cmus: next";
fi

