#! /bin/sh

export HOME=/home/jneidel
. $HOME/.zsh/org.env

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ vacuum-sql-dbs.sh
Vacuum sqlite3 database files.
To be run via cron.
"; exit
fi

command -v sqlite3 >/dev/null || { echo "sqlite3 is not installed"; exit 1; }

vacuum() {
  sqlite3 "$1" VACUUM;
}

ARR="$ORG_MEDIA/manga/.yacreaderlibrary/library.ydb" # space separated array

echo "$ARR" | tr ' ' '\n' | while read dir; do
  vacuum "$dir"
done
