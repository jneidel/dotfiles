#! /bin/sh

~/scripts/cron/waitforinternet
~/.config/sensitive/update >/dev/null
~/code/geld/update-repo >/dev/null
