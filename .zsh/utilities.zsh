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
  grep --line-number --with-filename --no-messages --recursive --exclude-dir=node_modules --exclude-dir=coverage --exclude-dir=dist --exclude-dir=vendor --exclude=package-lock.json "$@"
  # short: grep -nHsr
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
