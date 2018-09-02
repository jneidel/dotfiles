alias idar="id3tag -a" # ar mp3 # artist
alias idal="id3tag -A" # ar mp3 # album
alias idco="lame --ti" # jpg mp3 # cover
alias getco="ffmpeg -y -i" # mp3 tmp/jpg

function cmco() {
  file=$(cmus-remote -Q | grep "file" | grep -o -P '\/.*\.' )
  getco $file"mp3" ~/tmp/cmus-cover.jpg NUL
  fkill -f sxiv NE
  sxiv ~/tmp/cmus-cover.jpg &
}
function cmm() {
  cmus-remote -C "toggle aaa_mode"
  printf "AAA: "
  cmus-remote -C "set aaa_mode" | cut -d "'" -f 2 | cut -d "=" -f 2
}
alias cma="cmus-remote -C 'set aaa_mode=all'"

