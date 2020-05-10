#!/bin/sh

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ] || [ -z "$4" ]; then
  cat << EOF
$ get-progress-string.sh ITEMS FILLED UNFILLED PERCENTAGE
Generate a progress bar

Parameters:
  \$1: number of total items in the bar
  \$2: look of filled items
  \$3: look of unfilled items
  \$4: percentage of items filled

Example:
  $ get-progress-string.sh 10 '▪' '-' 50
  #-> ▪▪▪▪▪-----
EOF
  exit
fi

ITEMS="$1"
FILLED_ITEM="$2"
NOT_FILLED_ITEM="$3"
PERCENTAGE="$4"

FILLED_ITEMS=$((${ITEMS} * ${PERCENTAGE}/100))
NOT_FILLED_ITEMS=$(($ITEMS - $FILLED_ITEMS))

filled=$(printf "%${FILLED_ITEMS}s" | sed "s: :${FILLED_ITEM}:g")
unfilled=${bar}$(printf "%${NOT_FILLED_ITEMS}s" | sed "s: :${NOT_FILLED_ITEM}:g")
printf "${filled}${unfilled}\n"
