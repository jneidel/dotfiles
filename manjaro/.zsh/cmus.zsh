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
function cmco() { # get cover
  file=$(cmus-remote -Q | grep "file" | grep -o -P '\/.*\.' )
  getco $file"mp3" ~/tmp/cmus-cover.jpg NUL
  fkill -f sxiv NE
  sxiv ~/tmp/cmus-cover.jpg
}

# set mp3 tags
alias idar="id3tag -a" # ar mp3 # artist
alias idal="id3tag -A" # al mp3 # album
alias idso="id3tag -s" # so mp3 # song
alias idco="lame --ti" # jpg mp3 # cover
alias getco="ffmpeg -y -i" # mp3 tmp/jpg

