# misc

alias dir="dirs -v | head -10"

## colortest
alias colortest="~/.vim/colors/colortest"
alias colortest2="colortest -w -r -s | grep / --color=never L"

## Open links
alias imgweek="$B https://getcomics.info/tag/image-week >/dev/null 2>&1 &; disown"
alias imgrel="$B https://imagecomics.com/comics/new-releases >/dev/null 2>&1 &; disown"

alias relax="mpvo 'https://www.youtube.com/watch?v=5qap5aO4i9A'"
mpdg() {
  $B "https://genius.com/search?q=$(urlencode "$(mpc-get '%artist% %title%')")"
  # todo: strip feat.
}

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
