#! /bin/sh

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ cleanup-fs
Removes irrelevant files/dirs polluting the home directory
"; exit
fi

# files
rm ~/.python_history \
  ~/.sqlite_history \
  ~/.bash_history \
  ~/1 \
  ~/.octave_hist \
  ~/.Xauthority 2>/dev/null

# dirs
rmdir ~/Desktop \
  ~/.newsboat 2>/dev/null
rm -r ~/.w3m \
  ~/.m2 \
  ~/.mono \
  ~/.pki \
  ~/.gnome 2>/dev/null

~/scripts/cron/cron-notify-send "Cleaned up fs"
