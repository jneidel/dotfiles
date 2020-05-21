# misc

alias dir="dirs -v | head -10"

## colortest
alias colortest="~/.vim/colors/colortest"
alias colortest2="colortest -w -r -s | grep / --color=never L"

## Open links
alias imgweek="$B https://getcomics.info/tag/image-week/"
alias imgrel="$B https://imagecomics.com/comics/new-releases"

alias relax="mpvo 'https://www.youtube.com/watch?v=5qap5aO4i9A'"
mpdg() {
  $B "https://genius.com/search?q=$(urlencode "$(mpc-get '%artist% %title%')")"
  # todo: strip feat.
}
