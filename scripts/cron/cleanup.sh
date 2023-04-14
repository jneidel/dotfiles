#! /bin/sh

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ cleanup-fs
Removes various irrelevant files/dirs
"; exit
fi

# histories
rm ~/.python_history ~/.sqlite_history ~/.bash_history

# dirs
rm ~/1 ~/.octave_hist
rmdir ~/Desktop ~/.newsboat
rm -r ~/.w3m ~/.m2 ~/.mono ~/.pki ~/.gnome

# ~/scripts/cron/cron-notify-send "Cleaned up fs"
