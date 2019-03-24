#! /bin/bash

SCRIPTS_DIR=~/scripts/now

MANGA_FILE=~/.mangareader-dl.json
TMP_FILE=~/tmp/manga-data
SERVER_FILE=~/html/src/data/now-manga.json
SERVER=u

if [[ $1 = "--help" ]] || [[ $1 = "help" ]]; then
  echo "$ get-manga.sh"
  echo "Get subscribed manga from your mangareader-dl config at: $MANGA_FILE"
  exit
fi

echo "Creating temporary file at $TMP_FILE"
cat $MANGA_FILE | $SCRIPTS_DIR/sort-manga.js > $TMP_FILE

echo "Uploading temp file to $SERVER:$SERVER_FILE"
scp $TMP_FILE "$SERVER:$SERVER_FILE"

