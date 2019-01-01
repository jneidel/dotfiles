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

## readers
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
alias -g HP="--help | less"
alias -g LL="2>&1 | less" # shallow errors

## filter
alias -g G="| grep"
alias -g GP="| grep -P"
if [ -e ~/scripts/hhighlighter.sh ]; then
  source ~/scripts/hhighlighter.sh;
  alias -g HL="| hhighlighter -i"
fi

alias W="watch -t -d -n 1" # update 1s

alias -g NE="2> /dev/null" # swallow errors
alias -g NUL="> /dev/null 2>&1" # errors only

function trim(){
  VAR=$1
  VAR="$(echo -e "${VAR}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  echo -n $VAR
}

function extractmo() {
  DIR=.

  for F in $DIR/*\(320\ MP3\)*; do
    extract $F
    rm cover.jpg
    rm $F
    TITLE=$(echo $F | cut -d "/" -f 2)
    TITLE=$(echo $TITLE | cut -d "(" -f 1)
    TITLE=$(trim $TITLE)
    id3tag -s $TITLE *$TITLE*.mp3
    mid3v2 --TPE2 "Monstercat" -A "Mixed" *$TITLE*.mp3
    mv *$TITLE*.mp3 ~/music/Singles/Monstercat\ -\ Mixed/
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

alias urlencode='node -e "console.log( encodeURIComponent( process.argv[1] ) )"'
alias urldecode='node -e "console.log( decodeURIComponent( process.argv[1] ) )"'

alias randomnum="shuf -n 1 -i" # As range: 1-100

alias imgweek="$BROWSER https://getcomics.info/tag/image-week/"
alias explained="$BROWSER https://www.imdb.com/title/tt8005374/episodes"
alias letsplay="$BROWSER https://www.webtoons.com/en/romance/letsplay/list\?title_no\=1218"
alias are3="$BROWSER https://1337x.to/search/adam+ruins+everything+s03/1/"

alias pewds="ytdl $1 $2 https://www.youtube.com/user/PewDiePie/videos"
alias pyro="ytdl $1 $2 https://www.youtube.com/user/Pyrocynical/videos"
alias -g PE="--playlist-end"

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
      (*) echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

