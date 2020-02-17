# mp3 tagging

# set tags
alias idar="eyeD3 --artist"
alias idal="eyeD3 --album"
alias idarr="eyeD3 --album-artist"
alias ids="eyeD3 --title"
alias idn="eyeD3 --track"
alias idco="eyeD3 --add-image"
alias getco="ffmpeg -y -i" # mp3 tmp/jpg
# see ~/scripts/idmi

## get cover
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

