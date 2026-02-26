#! /bin/sh

~/scripts/cron/waitforinternet
~/.config/sensitive/update >/dev/null 2>&1
~/code/geld/update-repo >/dev/null 2>&1
