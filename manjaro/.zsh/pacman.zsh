# pacman

# uses packer as a pacman/yaourt wrapper
# searche, install, update for both
# remove needs to happen separately

alias pac="packer-aur --noconfirm --noedit -S" # install
alias pacs="packer-aur -Ss" # search
alias pacu="~/scripts/system-update.sh" # update
alias pacr="sudo pacman -Rsn" # remove pacman
alias aurr="sudo yaourt -Rsn" # remove yaourt

alias paco="sudo pacman -Qdt" # list orphans
alias pacor"sudo pacman -Rsn $(pacman -Qtdq)" # rm orphans

function pacss() { # highlight search query
  pacs $1 $2 $3 HL $1 $2 $3 L
}

