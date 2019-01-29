# misc

## utilities
### calculator
calc() { # for a quick, one off calc
  echo "$1" | bc # -l <- spammy
} # or use: echo $((<calc>))
alias calculator='python -ic "from __future__ import division; from math import *; from random import *"' # for multiple calculations, interactive

## calendar
alias calendar="cal -mn 6"
alias cal3="cal -3m"

## shortcuts
alias h="cd;clear;"
alias v="vim"
alias rmr="rm -r"
alias cpr="cp -r"
alias cpdir="cp -r"
alias cmx="chmod +x"
alias dirsize="du -sh"
alias W="watch -t -d -n 1" # update 1s
alias src="source ~/.zshrc"
mdc() { # MkDirCd
  mkdir "$1";
  cd "$1";
}

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

## Globals (can be accessed everywhere in a command)
### Readers
alias -g L="| less"         # open in reader
alias -g H="| head"         # print first 10 lines
alias -g T="| tail"         # print last 10 lines
alias -g HP="--help | less" # show help in reader
alias -g LL="2>&1 | less"   # shallow errors and open in reader

## Filter text
alias -g G="| grep"
alias -g GP="| grep -P"
if [ -e ~/scripts/hhighlighter.sh ]; then
  source ~/scripts/hhighlighter.sh;
  alias -g HL="| hhighlighter -i" # highlight the given words
fi

## Format text
alias -g PP="| pjson" # pretty print json

## Redirect stdout/stderr
alias -g NE="2> /dev/null"      # only stdout
alias -g NUL="> /dev/null 2>&1" # only stderr

## Open links
alias imgweek="$B https://getcomics.info/tag/image-week/"
alias letsplay="$B https://www.webtoons.com/en/romance/letsplay/list\?title_no\=1218"

## Extract/tag/move monstercat songs
function extractmo() { # singles
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
function extractmoep() { # eps
  DIR=.
  for F in $DIR/*\(320\ MP3\)*; do
    extract $F
    rm $F
  done

  mv *EP* ~/ct/music/
}

## Unused
function trim(){
  VAR=$1
  VAR="$(echo -e "${VAR}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  echo -n $VAR
}
alias hdmi="xrandr --output HDMI1 --auto" # dublicate screen on connected hdmi

