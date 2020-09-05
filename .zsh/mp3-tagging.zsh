# mp3 tagging

# set tags
alias idar="eyeD3 --artist" # -a
alias idal="eyeD3 --album" # -A
alias idarr="eyeD3 --album-artist" # -b
alias idt="eyeD3 --title" # -t
alias ids="idt"
alias idn="eyeD3 --track" # -n (-n 0 -N 0 to clear)
alias idco="eyeD3 --add-image" # image:FRONT_COVER mp3
alias getco="ffmpeg -y -i" # mp3 tmp/jpg
# see ~/scripts/idmi

## get cover
function mpdcoloop() { # requires sxiv, fkill (npm: fkill-cli)
  file="/home/jneidel/music/"$(mpc status -f "%file%" | grep mp3)

  if [ $1 != "" ]; then
    prev=$1

    if [ $prev != $file ]; then
      mdpco &
    fi
  fi

  sleep 5
  mpdcoloop $file &
}
function mpdcol() { # get cover & update cover once song changes
  mpdco &
  mpdcoloop N1 &
}

