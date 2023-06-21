if [ "$(uname)" = "Linux" ]; then
  ## variables
  export MAKEFLAGS="-j$(nproc)" # parallel compilation on make/makepkg

  alias paco="yay -Qdt" # list orphans
  alias pacor"yay -Rsn $(pacman -Qtdq)" # rm orphans
fi
