#! /bin/sh

DIR=~/.zsh

for i in $(ls $DIR/*.zsh | grep -v "init.zsh"); do
  source $i
done

