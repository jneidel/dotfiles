#! /bin/bash

SCRIPTS_DIR=~/scripts/now

if [[ $1 = "--help" ]] || [[ $1 = "help" ]]; then
  echo "$ update-media.sh"
  echo "Run now update scripts and rebuild webpage."
  exit
fi

$SCRIPTS_DIR/get-manga.sh
$SCRIPTS_DIR/get-comics.sh

$SCRIPTS_DIR/rebuild.sh

