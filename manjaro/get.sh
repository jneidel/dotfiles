#! /bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ "$1" = "--help" ] || [ "$1" = "help" ]; then
  echo "$ get.sh"
  echo "Copy the local dotfiles to this repo."
  echo "Uses the mapping/commands from ./mappings"
  exit
fi

function get-dir {
  mkdir -p $2
  #cp -r $1/* $2
  echo "copied dir:  $(echo $1 | cut -d "/" -f 4-)"
}

function get-file {
  #cp $1 $2
  echo "copied file: $(echo $1 | cut -d "/" -f 4-)"
}

function create-dir {
  mkdir -p $1
  echo "created dir: $2"
}

function get-files {
  IFS=$'\n'
  for IN in $(cat /dev/stdin); do
    REPO="$DIR/$IN"
    LOCAL="$HOME/$IN"

    [ -d "$LOCAL" ] && get-dir $LOCAL $REPO
    [ -f "$LOCAL" ] && get-file $LOCAL $REPO
    [ "$(echo "$IN" | cut -d " " -f1)" = "create" ] && create-dir "$DIR/$(echo "$IN" | cut -d " " -f 2-)" "$(echo "$IN" | cut -d " " -f 2-)"
  done
}

cat $DIR/mappings |
  grep -v "^#" |
  grep -v "^\s*$" |
  grep -v "^\[" |
  get-files

exit 0

