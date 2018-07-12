# pacman

# uses packer as a pacman/yaourt wrapper
# searche, install, update for both
# remove needs to happen separately

alias pac="packer -S" # install
alias pacs="packer -Ss" # search
alias pacu="sudo packer -Syu" # update
alias pacr="sudo pacman -Rsn" # remove pacman
alias aurr="sudo yaourt -Rsn" # remove yaourt

