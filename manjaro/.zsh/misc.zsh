# misc

alias v="vim"
alias src="source ~/.zshrc"
mdc() { # MkDirCd
  mkdir "$1";
  cd "$1";
}
calc() { # for a quick, one off calc
  echo "$1" | bc -l
}
alias calculator='python -ic "from __future__ import division; from math import *; from random import *"' # for multiple calculations, interactive
alias calendar="cal -mn 6"
alias cal3="cal -3m"
alias cmx="chmod +x"
alias hdmi="xrandr --output HDMI1 --auto" # dublicate screen on connected hdmi
alias h="cd;clear;"
alias cpdir="cp -r"
alias dirsize="du -sh"
alias pkg="vim package.json"
alias pkgl="cat package.json L"
alias colortest="~/.vim/colors/colortest"
alias colortest2="colortest -w -r -s | grep / --color=never L"
alias imgweek="chrome https://getcomics.info/tag/image-week/"

## readers
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
alias -g HP="--help | less"
alias -g LL="2>&1 | less" # shallow errors

## filter
alias -g G="| grep"
if [ -e ~/.scripts/hhighlighter.sh ]; then
  source ~/.scripts/hhighlighter.sh;
  alias -g HL="| hhighlighter -i"
fi

alias W="watch -t -d -n 1" # update 1s

alias -g NE="2> /dev/null" # swallow errors
alias -g NUL="> /dev/null 2>&1" # errors only

function extract() {
  if [ -f $1 ]; then
    case $1 in
      (*.tar.gz) tar xzf $1 ;;
      (*.tgz) tar xzf $1 ;;
      (*.tar.bz2) tar xjf $1 ;;
      (*.tbz2) tar xjf $1 ;;
      (*.tar) tar xf $1 ;;
      (*.cbt) tar xf $1 ;;
      (*.bz2) bunzip2 $1 ;;
      (*.rar) rar x $1 ;;
      (*.cbr) rar x -ad $1 ;;
      (*.gz) gunzip $1 ;;
      (*.zip) unzip $1 ;;
      (*.cbz) unzip $1 ;;
      (*.Z) uncompress $1 ;;
      (*.7z) 7z x $1 ;;
      (*.deb) ar x $1 ;;
      (*) echo "don't know how to extrack '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

alias pulsere="~/scripts/pulsere.sh"

