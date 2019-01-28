# misc

alias v="vim"
alias src="source ~/.zshrc"
mdc() { # MkDirCd
  mkdir "$1";
  cd "$1";
}
calc() { # for a quick, one off calc
  echo "$1" | bc # -l <- spammy
}
alias calculator='python -ic "from __future__ import division; from math import *; from random import *"' # for multiple calculations, interactive
alias calendar="cal -mn 6"
alias cal3="cal -3m"
alias cmx="chmod +x"
alias hdmi="xrandr --output HDMI1 --auto" # dublicate screen on connected hdmi
alias h="cd;clear;"
alias cpdir="cp -r"
alias cpr="cp -r"
alias rmr="rm -r"
alias dirsize="du -sh"
alias pkg="vim package.json"
alias pkgl="cat package.json L"
alias colortest="~/.vim/colors/colortest"
alias colortest2="colortest -w -r -s | grep / --color=never L"
alias randomnum="shuf -n 1 -i" # As range: 1-100
alias urlencode='node -e "console.log( encodeURIComponent( process.argv[1] ) )"'
alias urldecode='node -e "console.log( decodeURIComponent( process.argv[1] ) )"'
alias W="watch -t -d -n 1" # update 1s
function trim(){
  VAR=$1
  VAR="$(echo -e "${VAR}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  echo -n $VAR
}
alias macros="vim ~/.vim/config/macros.vim"

# Globals
## Readers
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
alias -g HP="--help | less"
alias -g LL="2>&1 | less" # shallow errors

## Filter
alias -g G="| grep"
alias -g GP="| grep -P"
if [ -e ~/scripts/hhighlighter.sh ]; then
  source ~/scripts/hhighlighter.sh;
  alias -g HL="| hhighlighter -i"
fi

## Format
alias -g PP="| pjson"

## Redirect
alias -g NE="2> /dev/null" # swallow errors
alias -g NUL="> /dev/null 2>&1" # errors only

# Links
alias imgweek="$B https://getcomics.info/tag/image-week/"
alias letsplay="$B https://www.webtoons.com/en/romance/letsplay/list\?title_no\=1218"

# Extract/tag/move monstercat songs
function extractmo() {
  DIR=.

  for F in $DIR/*\(320\ MP3\)*; do
    extract $F
    TITLE=$(echo $F | cut -d "/" -f 2)
    TITLE=$(echo $TITLE | cut -d "(" -f 1)
    TITLE=$(trim $TITLE)
    cd *$TITLE*
    rm cover.jpg
    rm $F
    id3tag -s $TITLE *$TITLE*.mp3
    mid3v2 --TPE2 "Monstercat" -A "Mixed" *$TITLE*.mp3
    mv *$TITLE*.mp3 ~/music/Singles/Monstercat-Current
    cd ~/Downloads
    rmr *$TITLE*
  done
}
function extractmoep() {
  DIR=.

  for F in $DIR/*\(320\ MP3\)*; do
    extract $F
    rm $F
  done

  mv *EP* ~/ct/music/
}

