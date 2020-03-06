#! /bin/sh
# shared functions for queue scripts, like bookq and listeningq

# A queue is a list to be "worked off".
# There is no editing by design, otherwise you will always delay a few items,
# which will lead to them never being done and you feeling bad about it.

help() {
  name="$1"
  desc="$2"
  unit="$3"
  ex1="$4"
  ex2="$5"
  arg="$6"

  if [ "$arg" = "--help" ] || [ "$arg" = "-h" ] || [ "$arg" = "help" ]; then
    printf "$ $name [a|r|l]
  Interact with the $desc located at '$QUEUE_FILE'

  Commands:
    <none> : print first entry
    a, add : append new $unit
    r, rm  : unshift, remove first entry
    l, list: list all entries

  Examples:
    $ $name
    #-> $ex1

    $ $name rm
    #-> $ex2

    $ $name a '$ex1'
"; exit
  fi
}

first() {
  head "$QUEUE_FILE" -n 1 2>/dev/null
}
remove() {
  printf "Removed '$(first)' from the queue"
  sed "1d" -i "$QUEUE_FILE"
}
add() {
  printf "$1\n" >> $QUEUE_FILE
  echo "Added '$1' to the queue"
}
list() {
  cat "$QUEUE_FILE"
}

parseCases() {
  case $1 in
    a|add)
      input="$@"
      input="${input#* }"
      add "$input";;
    r|rm) remove;;
    l|list) list;;
    *) first;;
  esac
}
