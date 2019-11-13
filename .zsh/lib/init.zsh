#! /bin/sh

DIR=$ZSH_DIR/lib

for i in $(ls $DIR | grep -v "init.zsh"); do
  source $DIR/$i
done

