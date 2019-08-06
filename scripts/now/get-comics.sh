#! /bin/bash

SCRIPTS_DIR=~/scripts/now

COMICS_FILE=~/code/getcomics-dl/comics.json
TMP_FILE=~/tmp/comics-data
SERVER_FILE=~/html/src/data/now-comics.json
SERVER=u

if [[ $1 = "--help" ]] || [[ $1 = "help" ]]; then
  echo "$ get-comics.sh"
  echo "Get subscribed comics from your getcomics-update config at: $COMICS_FILE"
  exit
fi

echo "Creating temporary file at $TMP_FILE"
cat $COMICS_FILE | $SCRIPTS_DIR/sort-comics.js > $TMP_FILE

echo "Uploading temp file to $SERVER:$SERVER_FILE"
scp $TMP_FILE "$SERVER:$SERVER_FILE"

