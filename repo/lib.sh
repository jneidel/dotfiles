#! /bin/sh
# shared environment and functions

# TODO: make /etc files work

MAPPINGS="$DIR/mappings"
APP_LIST="$DIR/app-groups"
IN_USE="$DIR/used-groups"
IN_USE_TMP=/tmp/used-apps
sed -r "s/^(.*)$/^\1$/" $IN_USE >$IN_USE_TMP

[ ! -z $DRY ] && echo DRYRUN

BASE=$DIR/..

function copy-dir {
  [ -z $DRY ] && mkdir -p $2
  [ -z $DRY ] && cp -r $1/* $2
  echo "copy dir:    $(echo $1 | cut -d "/" -f 4-)"
}

function copy-file {
  [ -z $DRY ] && cp $1 $2
  echo "copy file:   $(echo $1 | cut -d "/" -f 4-)"
}

function create-dir {
  [ -z $DRY ] && mkdir -p "$1"
  echo "create dir:  $1"
}

function clean-copy-dir {
  [ -z $DRY ] && rm -r $2
  copy-dir "$1" "$2"
}

function run-command {
  CMD=$(echo "$1" | cut -d\  -f2)
  echo "run cmd:      $CMD"
  [ -e "$CMD" ] && sh $CMD || echo file does not exist
}
