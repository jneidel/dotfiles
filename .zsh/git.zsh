# git

## status
alias s="git status -sb" # -s short output, -b branch info

## add
alias ga="git add"
alias add="ga -A; s" # -A all, even removed
alias gai="git add -i" # interactive
alias gap="git add -p" # patch

## commit
alias commit="git commit -m"
alias gc="commit"
alias addcom="git add .; git commit -m"
alias ac="addcom"

## commit --amend
alias amend="git commit --amend"
alias amendd="git commit --amend --no-edit"
alias addam="git add .; git commit --amend --no-edit"
amd() { # set commit date to passed date
  # pass dayOfTheWeek, month, date, hour
  # eg: Sun Apr 6 12
  git commit --amend --no-edit --date="$1 $2 $3 $4:35:25 2019 +0200"
}
amtod() { # set commit date to today
  # pass hour
  DATE=`date +"%a %h %e"`;
  git commit --amend --no-edit --date="$DATE $1:35:25 2019 +0200"
}

## push/pull
# alias gp="disable-mullvad-for git push"
# alias push="disable-mullvad-for git push origin"
# alias pushf="disable-mullvad-for git push --force-with-lease origin"
# alias pushup="disable-mullvad-for git push --set-upstream origin"
alias gp="git push"
alias push="git push origin"
alias pushf="git push --force-with-lease origin"
alias pushup="git push --set-upstream origin"
alias pull="git pull origin"
alias master="git pull origin master; git push origin master"
alias gpu="git push uber master"

## checkout
alias co="git checkout"
alias com="git checkout master"
alias cob="git checkout -b"

## rebase
alias gr="git rebase"
alias gri="git rebase -i"
alias grc="git rebase --continue"
alias gra="git rebase --abort"

## branch
alias gb="git branch"

## reset
alias re="git reset -q; s"
alias reh="git reset --hard"

## log
alias gl="git log --oneline --graph --decorate"
alias reflog="git reflog"

## diff
alias gd="git diff"

