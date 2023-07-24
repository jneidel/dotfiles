#! /bin/sh

# env vars first
for env_file in $(ls $ZSH_DIR/*.env); do
  source $env_file
done
source ~/scripts/colored-man.env

# aliases second
for alias_file in $(ls $ZSH_DIR/*.zsh | grep -v "init.zsh"); do
  source $alias_file
done
