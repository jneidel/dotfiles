# pacman

# uses packer as a pacman/yaourt wrapper
# searche, install, update for both
# remove needs to happen separately

alias pac="yay --noconfirm -S" # install
alias pacs="yay -Ss" # search
alias pacu="~/scripts/system-update.sh" # update
alias pacr="yay -Rsn" # remove pacman

alias paco="sudo pacman -Qdt" # list orphans
alias pacor"sudo pacman -Rsn $(pacman -Qtdq)" # rm orphans

function pacss() { # highlight search query
  pacs $1 $2 $3 HL $1 $2 $3 L
}

