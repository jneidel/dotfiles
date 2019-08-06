# pacman

# uses yay as a pacman/yaourt wrapper
# searche, install, update for both
# remove needs to happen separately

## install
alias pac="yay --noconfirm --noedit -S"

## seach
alias pacs="yay -Ss"

function pachs() { # highlight query
  pacs $1 $2 $3 HL $1 $2 $3 L
}
function pacss() { # stict search
  pacs $1 jq | grep --color=auto "/$1" -A 1
}

## update
alias pacu="yay -Syuu"

## remove
alias pacr="yay -Rsn"

alias paco="yay -Qdt" # list orphans
alias pacor"yay -Rsn $(pacman -Qtdq)" # rm orphans

