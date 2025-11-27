# git

## status
alias s="git status -sb 2>/dev/null" # -s short output, -b branch info

## add
alias ga="git add"
alias add="ga -A; s" # -A all, even removed
alias gai="git add -i" # interactive
alias gap="git add -p" # patch
alias unadd="git restore --staged"
alias unstage="unadd"

## commit
commit() {
  MSG="$1"
  DESC="$2"
  EXTRA="$3"
  if [ -z "$MSG" ]; then
    false
  else
    if [ -z "$DESC" ]; then
      git commit -m "$MSG" $EXTRA
    else
      git commit -m "$MSG" -m "$DESC" $EXTRA
    fi
  fi
}
alias gc="commit"
alias gcf="git commit --fixup" # HASH to fixup, tutorial: https://www.mikulskibartosz.name/git-fixup-explained
gcff() { # fast fixup
  hash=$1
  git commit --fixup $hash
  GIT_SEQUENCE_EDITOR=: gri $hash+
}
gcn() { # --no-verify, ignore hooks
  commit "$1" "$2" -n
}
if [ "$(uname)" = "Darwin" ]; then
  alias addcom="ga -A; gcn"

  alias amend="git commit -n --amend"
  alias amendd="git commit -n --amend --no-edit"
  alias addam="ga -A; git commit -n --amend --no-edit"
else
  alias addcom="ga -A; commit"

  ## commit --amend
  alias amend="git commit --amend"
  alias amendd="git commit --amend --no-edit"
  alias addam="ga -A; git commit --amend --no-edit"
fi

## push/pull
alias gp="git push"
alias push="git push origin"
alias pushf="git push --force-with-lease origin"
alias pull="git pull origin"
alias master="git pull origin master; git push origin master"
alias gpu="git push uber master"
clone() {
  local repo="$1"
  git clone $repo
  cd $(echo $repo | rev | cut -d/ -f1 | cut -d. -f2- | rev)
}
alias stash="git stash"
alias stashp="stash pop"

## checkout
# alias co="git checkout" # replace by script of the same name
alias com="git checkout master 2>/dev/null || git checkout main"
alias cob="git checkout -b"

## rebase
alias gr="git rebase"
gri() {
  hash=$1
  if [[ "$hash" =~ "\+$" ]]; then
    prevHash=$(git log --oneline --no-abbrev-commit | grep "^$(echo $hash | cut -d+ -f1)" -A1 | tail -n1 | cut -d\  -f1)
    echo "Using the commit hash prior to the one given: $prevHash"
    git rebase -i $prevHash
  else
    git rebase -i "$@"
  fi
}
alias grc="git rebase --continue"
alias gra="git rebase --abort"

## branch
alias gb="git branch"

## reset
re() {
  if [ -z "$1" ]; then
    git reset -q; s
  else
    git restore $@; s
  fi
}
alias reh="git reset --hard"

## log
alias gl="git log --oneline --graph --decorate --date=relative"
alias reflog="git reflog"

## diff
alias gd="git diff"
alias gds="gd --staged"

## ignore
alias ignore="git update-index --assume-unchanged"
alias unignore="git update-index --no-assume-unchanged"

## open repo in browser
gho() {
  git remote get-url origin | cut -d@ -f2 | rev | cut -d. -f2- | rev | sed 's|:|/|' | awk '{print "https://"$1}' | xargs -r $B >/dev/null 2>&1
}

## cherry-pick
alias gcp="git cherry-pick"
alias gcpc="git cherry-pick --continue"
alias gcpa="git cherry-pick --abort"

## show
gs() {
  if [ -n "$1" ]; then
    git show "$1"
  else
    clipBoardContents=
    if [ "$(uname)" = "Darwin" ]; then
      clipBoardContents="$(pbpaste)"
    else
      clipBoardContents="$(xclip -o -sel clip)"
    fi
    if [[ "$clipBoardContents" =~ ^[a-zA-Z0-9]{1,7}$ ]]; then
      echo "Using hash from clipboard: $clipBoardContents"
      git show "$clipBoardContents"
    elif ! git diff --cached --exit-code >/dev/null; then
      gd --staged # show staged changes
    else
      git show # show last commit
    fi
  fi
}

## completions
_complete_unstaged_changed_deleted_new_files() {
  local files=($(git status --porcelain | cut -c3-))
  compadd -a files
}
_complete_unstaged_changed_deleted_files() {
  local files=($(git status --porcelain | grep -e"^ M" -e"^ D" | cut -c3-))
  compadd -a files
}
compdef _complete_unstaged_changed_deleted_new_files ga
compdef _complete_unstaged_changed_deleted_new_files gai
compdef _complete_unstaged_changed_deleted_new_files gap
compdef _complete_unstaged_changed_deleted_files re
