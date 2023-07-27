#! /bin/sh

## env variables
test -e "$ZSH_DIR/org.env" && source $ZSH_DIR/org.env
for env_file in $(find $ZSH_DIR -type f -name '*.env' -not -path "$ZSH_DIR/org.env"); do
  source $env_file
done
test -e "~/scripts/colored-man.env" && source ~/scripts/colored-man.env

## aliases
for alias_file in $(find $ZSH_DIR -type f -name '*.zsh' -not -path "$ZSH_DIR/lib/*" -not -path "$ZSH_DIR/init.zsh"); do
  source $alias_file
done
