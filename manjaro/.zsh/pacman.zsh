# pacman

# uses packer as a pacman/yaourt wrapper
# searche, install, update for both
# remove needs to happen separately

alias pac="packer --noconfirm --noedit -S" # install
alias pacs="packer -Ss" # search
alias pacu="~/.scripts/system-update.sh" # update
alias pacr="sudo pacman -Rsn" # remove pacman
alias aurr="sudo yaourt -Rsn" # remove yaourt

alias paco="sudo pacman -Qdt"
alias pacor"sudo pacman -Rsn $(pacman -Qtdq)"

