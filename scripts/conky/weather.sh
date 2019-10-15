#! /bin/bash

# Source:
#   https://bbs.archlinux.org/viewtopic.php?id=37381
# Lookup location codes:
#   https://pastebin.com/dbtemx5F

LOCATION="EUR|DE|GM003|BERLIN"

if [[ $1 = "--help" ]] || [[ $1 = "help" ]]; then
  echo "$ weather"
  echo "Get the current weather for your location"
  echo ""
  echo "Parameters:"
  echo "  \$1: location code, format: 'EUR|DE|GM003|BERLIN'"
  exit
fi

DEGREES_METRIC=1 # 0 = F; 1 = C

curl -s http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=$DEGREES_METRIC\&locCode\=$LOCATION | perl -ne 'if (/Currently/) {chomp;/\<title\>Currently: (.*)?\<\/title\>/; print "$1"; }'

