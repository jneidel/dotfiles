export ALTERNATE_EDITOR=vim

eshell-alises-from-zsh() {
  alias | sed 's/^alias //' | sed -E "s/^([^=]+)='(.+?)'$/\1=\2/" | sed "s/'\\\\''/'/g" | sed "s/'\\\\$/'/;" | sed -E 's/^([^=]+)=(.+)$/alias \1 \2/' >~/.emacs.d/eshell/alias
  # Source: https://www.emacswiki.org/emacs/EshellAlias
}

