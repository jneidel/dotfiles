#! /bin/sh

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ cleanup-fs
Removes various irrelevant files/dirs
"; exit
fi

# latex
cd ~/code/latex
rm *.aux *.log *.synctex.gz *.pdf

# histories
rm ~/.python_history ~/.sqlite_history ~/.bash_history

# dirs
rmdir ~/Desktop
rm ~/1
rm -r ~/.w3m
rm ~/.newsboat

# ~/scripts/cron/cron-notify-send "Cleaned up fs"
