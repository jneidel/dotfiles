# utility functions

## calculator
calc() {
  if [ -n "$1" ]; then
    node -e "console.log( ($@).toFixed(2) )"
  else
    octave -q
  fi
}
calcd() {
  node -e "console.log($@)"
}
alias calculator='python -ic "from __future__ import division; from math import *; from random import *"' # for multiple calculations, interactive

## url en/decode
alias urlencode='node -e "console.log( encodeURIComponent( process.argv[1] ) )"'
alias urldecode='node -e "console.log( decodeURIComponent( process.argv[1] ) )"'

## generate a random number
alias randomnum="shuf -n 1 -i" # As range: 1-100
alias dice="W $(whence randomnum) 1-6"

## grep
_in() {
  if command -v rga >/dev/null; then
    rg --hidden --glob='!.git/' --glob '!git/' --glob '!node_modules/' --glob '!.cache' --glob '!vendor/' --glob '!teams-for-linux/' --glob '!.local/lib' --glob '!.local/share/*/' --glob '!BraveSoftware/' --glob '!chromium' --glob '!chrome/' --glob '!firefox/' --glob '!Signal' --glob '!.ib-tws/' --glob '!.java/' --glob '!.hwid' --glob '!.zcompcache' --glob '!tmp/' --glob='!ct/manga' --glob='!ct/comics' --glob='!dotfiles/' -g='!coverage' -g='!dist/' -g='!build/' -g='!.cargo/' "$@" 2>/dev/null
  else
    grep --line-number --with-filename --no-messages --recursive --exclude-dir=node_modules --exclude-dir=coverage --exclude-dir=dist --exclude-dir=vendor --exclude=package-lock.json "$@"
    # short: grep -nHsr
  fi
}
in() {
  if [ -z "$2" ]; then
    _in "$1" .
  else
    _in "$@"
  fi
}

## ps
pst() {
  ps xwjf | awk '{ $1="";$3="";$4="";$5="";$6="";$7="";$8="";$9=""; print $0 }' | grep -v 'firefox-' | less
}
