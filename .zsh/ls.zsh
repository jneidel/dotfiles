export EXA_COLORS="di=1;34" # make dirs bold again

alias ls="exa --git-ignore"
alias la="exa -1a --git-ignore" # all
alias ld="exa -1D" # only dirs
alias li="exa -lah --git" # show permissions
alias lid="echo 'Sorted by modified date. Oldest to newest.'; li -s modified"
alias sl="ls" # typo correction
