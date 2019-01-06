# cmus

# remote control
alias cm="~/scripts/cmus/play-pause.sh"
alias cmn="~/scripts/cmus/next.sh"
alias cmp="~/scripts/cmus/previous.sh"
alias cma="cmus-remote -C 'set aaa_mode=all'"

function cmm() {
  cmus-remote -C "toggle aaa_mode"
  printf "AAA: "
  cmus-remote -C "set aaa_mode" | cut -d "'" -f 2 | cut -d "=" -f 2
}

# set mp3 tags
alias idar="id3tag -a" # ar mp3 # artist
alias idal="id3tag -A" # al mp3 # album
alias idaa="mid3v2 --TPE2" # ala mp3 # album artist
alias ids="id3tag -s" # so mp3 # song
alias idn="id3tag -t" # tr mp3 # tracknr
alias idco="lame --ti" # jpg mp3 # cover
alias getco="ffmpeg -y -i" # mp3 tmp/jpg

# get cover
function cmco() {
  file=$(cmus-remote -Q | grep "file" | grep -o -P '\/.*\.' )
  getco $file"mp3" ~/tmp/cmus-cover.jpg NUL
  fkill -f sxiv NE
  sxiv -f ~/tmp/cmus-cover.jpg
}
function cmcoloop() {
  file=$(cmus-remote -Q | grep "file" | grep -o -P '\/.*\.' )

  if [ $1 != "" ]; then
    prev=$1

    if [ $prev != $file ]; then
      cmco &
    fi
  fi

  sleep 5
  cmcoloop $file &
}
function cmcol() {
  cmco &
  cmcoloop NE &
}

