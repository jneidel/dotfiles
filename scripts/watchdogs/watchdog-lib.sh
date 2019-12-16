# shared functions for watchdogs

readJournal() {
  UNIT=$1
  CALLBACK=$2

  if [ -z "$UNIT" ] || [ -z "$CALLBACK" ]; then
    echo "Variables UNIT and CALLBACK cant be empty"
    exit 2
  fi

  journalctl -u $UNIT -f -o cat --since=now | while read -r line; do
    $CALLBACK $line
  done
}

notify() {
  notify-send -t 2000 -u low "$@"
}

