#! /bin/sh

if [ "$1" = "--help" ] || [ "$1" = "help" ]; then
  echo "$ hosts-status"
  echo "Print if /etc/hostss exists, i.e. the hosts file is deactivated"
  exit
fi

[ -f /etc/hostss ] && echo "  hosts off "

