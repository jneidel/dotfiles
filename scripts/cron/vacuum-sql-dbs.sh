#! /bin/sh

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

MANGA=~/manga/.yacreaderlibrary/library.ydb
COMIC=~/comics/.yacreaderlibrary/library.ydb
ARR="$MANGA $COMIC"

echo "$ARR" | tr ' ' '\n' | while read dir; do
  vacuum $dir
done
