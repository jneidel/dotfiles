if [ "$(uname)" = "Darwin" ]; then
  alias brew="HOMEBREW_NO_INSTALL_CLEANUP=1 HOMEBREW_NO_AUTO_UPDATE=1 /usr/local/bin/brew"
fi
