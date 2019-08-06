# mp3 tagging

# set tags
alias idar="id3tag -a" # ar mp3 # artist
alias idal="id3tag -A" # al mp3 # album
#alias idaa="mid3v2 --TPE2" # ala mp3 # album artist # resets all exisiting tags
alias ids="id3tag -s" # so mp3 # song
alias idn="id3tag -t" # tr mp3 # tracknr
alias idco="lame --ti" # jpg mp3 # cover
alias getco="ffmpeg -y -i" # mp3 tmp/jpg
# see ~/scripts/idmix

# get tags (prefix derived from cm[us])
## get lyrics
alias cmly="get-cmus-lyrics" # in ~/scripts

## get cover
function mpdco() {
  file="/home/jneidel/music/"$(mpc status -f "%file%" | grep mp3)
  getco $file ~/tmp/mpd-cover.jpg N2
  fkill -f sxiv N1 # kill prev instance
  sxiv -f ~/tmp/mpd-cover.jpg # img viewer
}
function mpdcoloop() { # requires sxiv, fkill (npm: fkill-cli)
  file="/home/jneidel/music/"$(mpc status -f "%file%" | grep mp3)

  if [ $1 != "" ]; then
    prev=$1

    if [ $prev != $file ]; then
      cmco &
    fi
  fi

  sleep 5
  cmcoloop $file &
}
function mpdcol() { # get cover & update cover once song changes
  cmco &
  cmcoloop N1 &
}

