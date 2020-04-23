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

## previous command hotkeys
# print previous command but only the first nth arguments
# see: https://github.com/gotbletu/shownotes/blob/master/bang_previous_commands_hotkeys.md
bindkey -s '\e1' "!:0 \t" # alt+1
bindkey -s '\e2' "!:0-1 \t" # alt+2
bindkey -s '\e3' "!:0-2 \t"
bindkey -s '\e4' "!:0-3 \t"
bindkey -s '\e5' "!:0-4 \t"
bindkey -s '\el' "!:0- \t" # alt+l - all but the last word

