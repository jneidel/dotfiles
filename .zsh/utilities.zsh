# utility functions

## calculator
calc() {
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
alias in="grep --line-number --with-filename --no-messages --recursive --exclude-dir=node_modules --exclude-dir=coverage --exclude-dir=dist --exclude=package-lock.json" # short: grep -nHsr

## ps
pst() {
  ps xwjf | awk '{ $1="";$3="";$4="";$5="";$6="";$7="";$8="";$9=""; print $0 }' | grep -v 'firefox-' | less
}

## cd
mdc() { # MkDirCd
  mkdir "$1";
  cd "$1";
}
mvc() { # mv cd
  array=( $@ )
  len=${#array[@]}
  args=${array[@]:0:$len-1}
  last="${@: -1}"

  mv $(echo $args) "$last"

  if [ -d "$last" ]; then
    cd "$last"
  else
    base="$(dirname $last)"
    cd "$base"
  fi
}

