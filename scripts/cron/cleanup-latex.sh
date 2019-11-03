#! /bin/sh

LATEX_DIR=~/code/latex

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ cleanup-latex
Removes *.aux *.log *.synctex.gz *.pdf file from $LATEX_DIR
"; exit
fi

cd $LATEX_DIR
rm *.aux *.log *.synctex.gz *.pdf

~/scripts/cron/cron-notify-send "Cleaned up latex"

