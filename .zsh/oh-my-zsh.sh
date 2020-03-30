# Initializes Oh My Zsh

# add a function path
# fpath=($OMZ/functions $OMZ/completions $fpath)

# Load all stock functions (from $fpath files) called below.
autoload -U compaudit compinit

# Ignore insecure files and directories, -u to enable
compinit -i -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
