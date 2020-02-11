#! /bin/sh

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  printf "$ update-notes.sh
Update note directories and push their changes to remote origin.
To be run via cron.
"; exit
fi

MISC=~/code/misc
NOTES=~/code/notes

update() {
  REPO="$1"
  ~/scripts/cron/cron-notify-send "Updating notes" "$REPO"

  g() {
    git -C "$REPO" "$@"
  }

  g add $REPO
  g commit -m "Update notes (auto)"
  g push origin master
}

cp ~/todo $NOTES
update "$MISC"
update "$NOTES"
