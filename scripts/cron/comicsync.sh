#! /bin/sh

OUT="$(~/scripts/comicsync | cut -d\  -f2- | rev | cut -d\  -f3- | rev)"

if [ -z "$OUT" ]; then
  ~/scripts/cron/cron-notify-send "Ran comicsync" -t 1300
else
  ~/scripts/cron/cron-notify-send "Ran comicsync" -t 6000 "$OUT" -u normal
fi

