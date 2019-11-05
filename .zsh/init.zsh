#! /bin/sh

DIR=~/.zsh

for i in $(ls $DIR | grep -v "init.zsh"); do
  source $DIR/$i
done

