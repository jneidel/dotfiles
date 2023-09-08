export EXA_COLORS="di=1;34" # make dirs bold again

alias ls="eza --time-style=relative --git-ignore"
alias la="eza --time-style=relative -1a --git-ignore" # all
alias ld="eza --time-style=relative -1D" # only dirs
alias li="eza --time-style=relative -lah --git" # show permissions
alias lid="echo 'Sorted by modified date. Oldest to newest.'; li -s modified"
alias sl="ls" # typo correction
