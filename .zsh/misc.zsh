# misc

## utilities
### calculator
# calc() { # for a quick, one off calc
#   echo "$1" | bc # -l <- spammy
# } # or use: echo $((<calc>))
calc() {
  node -e "console.log($@)"
}
alias calculator='python -ic "from __future__ import division; from math import *; from random import *"' # for multiple calculations, interactive

## calendar
alias calendar="cal -mn 6"
alias cal3="cal -3m"

## shortcuts
alias h="cd;clear;"
alias v="vim"
alias src="source ~/.zshrc"
alias W="watch -t -d -n 1" # update 1s
alias in="grep --line-number --with-filename --no-messages --recursive --exclude-dir=node_modules --exclude-dir=coverage --exclude-dir=dist --exclude=package-lock.json" # short: grep -nHsr
alias b="background"
alias back="bg; disown"

### recursive
alias rmr="rm -rf"
alias cpr="cp -r -v"

### change permissions
alias cmx="chmod +x" # add executable
alias cmd="chmod 755" # default dir
alias cmf="chmod 644" # default file

### dir/disk info
alias dirsize="du -sh"
alias ds="du -sh" # d[ir]s[ize]
alias disksize="df -h"

mdc() { # MkDirCd
  mkdir "$1";
  cd "$1";
}
alias mkdir="/usr/bin/mkdir -p"

### package.json
alias pkg="vim package.json"
alias pkgl="cat package.json L"

### colortest
alias colortest="~/.vim/colors/colortest"
alias colortest2="colortest -w -r -s | grep / --color=never L"

## url en/decode
alias urlencode='node -e "console.log( encodeURIComponent( process.argv[1] ) )"'
alias urldecode='node -e "console.log( decodeURIComponent( process.argv[1] ) )"'

## generate a random number
alias randomnum="shuf -n 1 -i" # As range: 1-100

## ps tree
pst() {
  ps xwjf | awk '{ $1="";$3="";$4="";$5="";$6="";$7="";$8="";$9=""; print $0 }' | grep -v 'firefox-' | bat
}

## vim mass rename
alias mmv="qmv -f do" # massmove

## Open links
alias imgweek="$B https://getcomics.info/tag/image-week/"
alias imgrel="$B https://imagecomics.com/comics/new-releases"

## Unused
alias hdmi="xrandr --output HDMI1 --auto" # dublicate screen on connected hdmi


## previous command hotkeys
# print previous command but only the first nth arguments
# see: https://github.com/gotbletu/shownotes/blob/master/bang_previous_commands_hotkeys.md
bindkey -s '\e1' "!:0 \t" # alt+1
bindkey -s '\e2' "!:0-1 \t" # alt+2
bindkey -s '\e3' "!:0-2 \t"
bindkey -s '\e4' "!:0-3 \t"
bindkey -s '\e5' "!:0-4 \t"
bindkey -s '\el' "!:0- \t" # alt+l - all but the last word

