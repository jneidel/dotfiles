# misc

alias dir="dirs -v | head -10"

## colortest
alias colortest="~/.vim/colors/colortest -w -r -s | grep / --color=never L"
hex() {
  echo $1 | tr a-z A-Z | awk '{ print "ibase=16;"$1 }' | bc
}

## Open links
get_latest_imgweek() {
  curl -SsL "https://getcomics.info/tag/image-week/" | grep -Po "href=\"\Khttps://getcomics.[^/]+/other-comics/.*?weekly-pack/\">" | grep -ve "comments" | head -n1 | cut -d\" -f1
}
alias imgweek="get_latest_imgweek | xargs $B >/dev/null 2>&1 &; disown"
# alias imgweek="$B https://getcomics.info/tag/image-week >/dev/null 2>&1 &; disown"
alias imgrel="$B https://imagecomics.com/comics/new-releases >/dev/null 2>&1 &; disown"
alias img="imgweek; echo ""; check-image-releases"

alias relax="mpvo 'https://www.youtube.com/watch?v=5qap5aO4i9A'"

## dice
roll_dice() {
  shuf -n1 -i 1-$1
}
alias d20="roll_dice 20"
alias d12="roll_dice 12"
alias d10="roll_dice 10"
alias d8="roll_dice 8"
alias d6="roll_dice 6"
alias d4="roll_dice 4"

## money greed index
feargreed() {
  FILE=$HOME/tmp/moneygreed-$(date +%m-%d).png
  curl -Ss https://money.cnn.com/data/fear-and-greed/ | grep -Po "https://markets.money.cnn.com/Marketsdata/.+?.png" | xargs curl -Ss -H 'Referer: ' --compressed --output $FILE
  sxiv $FILE
}

addwireguard() {
  connectionconf=$1
  connection=${connectionconf%%.*}
  nmcli connection import type wireguard file $connectionconf
  nmcli device set $connection autoconnect no
  nmcli connection modify $connection autoconnect no
  nmcli connection up $connection
  sleep 3s
  curl -Ss https://ipinfo.io
}
