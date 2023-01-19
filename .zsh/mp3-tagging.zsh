# mp3 tagging

# set tags
alias idar="eyeD3 --artist" # -a
alias idal="eyeD3 --album" # -A
alias idarr="eyeD3 --album-artist" # -b
alias idt="eyeD3 --title" # -t
alias ids="idt"
alias idn="eyeD3 --track" # -n (-n 0 -N 0 to clear)
alias idy="eyeD3 --recording-date"
idco() {
  local cover="$1:FRONT_COVER"
  shift
  eyeD3 --add-image "$cover" "$@"
}
alias getco="ffmpeg -y -i" # mp3 tmp/jpg
idcoa() {
  local clip="$(get-clip)"
  if echo $clip | grep -E '^https.+jpg$' >/dev/null; then
    wget $clip -O cover.jpg
  fi

  if [ -e "cover.jpg" ]; then
    echo "Tagging all mp3 files in this and all its subdirectories with cover.jpg"
    printf "Ok? (Y/n): "
    read ans
    [ "$ans" != "n" ] && find . -name '*.mp3' -exec sh -c 'eyeD3 --add-image cover.jpg:FRONT_COVER "$1"' sh {} ';'
    rm cover.jpg
  else
    echo "cover.jpg does not exist"
    false
  fi
}
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

