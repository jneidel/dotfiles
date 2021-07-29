#! /bin/sh

~/scripts/cron/cron-notify-send "sensitive update"
~/.sensitive/update

~/scripts/cron/cron-notify-send "projects update"
PROJECTS="$HOME/projects"
g() {
  git -C $PROJECTS "$@"
}
g add $PROJECTS
g commit -m "Update projects (auto)"
g push origin master
