# jujutsu (some shared stuff is in git.zsh)

# s (status)

## describe
alias describe="commit_describe"
alias jd="commit_describe"
# commit, gc

alias je="jj edit"

alias undo="jj undo"

alias jr="jj rebase"

alias squa="jj squash"

# jj abandon

# gs (show)
# log, gl
# gd (diff)

## branches
# gb (list branches)
# com (new from master)
# co (new from branch)
alias new="jj new"

## remote management
# push
# pull
# clone
alias jbl="jj bookmark list"
alias jbs="jj bookmark list | cut -d: -f1 | gum filter | xargs jj bookmark set"
alias jbsm="jj bookmark list -r 'trunk()' | cut -d: -f1 | xargs jj bookmark set"
alias jbd="jj bookmark delete"
alias jbc="jj bookmark set" # create
alias jba='jj bookmark advance -t "~description('') & @ | ~description('') & @-"' # pull nearest bookmark to non-empty @/@-
