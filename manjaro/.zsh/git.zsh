# git

## status
alias s="git status"

## add
alias ga="git add"
alias add="git add .; git status"

## commit
alias commit="git commit -m"
alias gc="commit"
alias addcom="git add .; git commit -m"

## commit --amend
alias amend="git commit --amend"
alias amendd="git commit --amend --no-edit"
alias addam="git add .; git commit --amend --no-edit"
amd() { # set commit date to passed date
  # pass dayOfTheWeek, month, date, hour
  # eg: Sun Apr 6 12
  git commit --amend --no-edit --date="$1 $2 $3 $4:35:25 2018 +0200"
}
amyest() { # set commit date to yesterday
  # pass hour
  DATE=`date -v -1d +"%a %h %e"`; # eg: Sun Apr 6
  git commit --amend --no-edit --date="$DATE $1:35:25 2018 +0200"
}
amtod() { # set commit date to today
  # pass hour
  DATE=`date +"%a %h %e"`;
  git commit --amend --no-edit --date="$DATE $1:35:25 2018 +0200"
}

## push/pull
alias gp="git push"
alias push="git push origin"
alias pushf="git push -f origin"
alias pushup="git push --set-upstream origin"
alias pull="git pull origin"
alias master="git pull origin master; git push origin master"

## checkout
alias co="git checkout"
alias com="git checkout master"

## rebase
alias gr="git rebase"
alias grc="git rebase --continue"
alias gra="git rebase --abort"

## branch
alias gb="git branch"
alias gbc="git checkout -b"

## reset
alias re="git reset"
alias reh="git reset --hard"

## log
alias gl="git log --oneline --graph --decorate"
alias reflog="git reflog"

## misc
alias gd="git diff"

