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

alias -g H="| head"
alias -g T="| tail"
alias -g G="| grep"
alias -g L="| less"
alias -g LL="2>&1 | less"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

