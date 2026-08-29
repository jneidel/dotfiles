# git (some jujutsu)

is_jj() {
  jj status >/dev/null 2>&1 
}

## status
s() {
  if is_jj; then
    jj status
  else
    git status -sb 2>/dev/null # -s short output, -b branch info
  fi
}

## add
alias ga="git add"
alias add="ga -A; s" # -A all, even removed
alias gai="git add -i" # interactive
alias gap="git add -p" # patch
alias unadd="git restore --staged"
alias unstage="unadd"

## commit/describe
commit_describe() {
  MSG="$1"
  DESC="$2"
  EXTRA="$3"
  if [ -z "$MSG" ]; then
    false
  else
    if [ -z "$DESC" ] || [ "$DESC" = "-r" ]; then
      if is_jj; then
        jj describe -m "$MSG" $EXTRA
      else
        git commit -m "$MSG" $EXTRA
      fi
    else
      if is_jj; then

        jj describe -m "$MSG" -m "$DESC" $EXTRA
      else
        git commit -m "$MSG" -m "$DESC" $EXTRA
      fi
    fi
  fi
}
alias commit="commit_describe"
alias gc="commit_describe"

alias gcf="git commit --fixup" # HASH to fixup, tutorial: https://www.mikulskibartosz.name/git-fixup-explained
gcff() { # fast fixup
  hash=$1
  git commit --fixup $hash
  GIT_SEQUENCE_EDITOR=: gri $hash+
}
gcn() { # --no-verify, ignore hooks
  commit "$1" "$2" -n
}
alias addcom="ga -A; commit"

## commit --amend
alias amend="git commit --amend"
alias amendd="git commit --amend --no-edit"
alias addam="git add -A; git commit --amend --no-edit"

## push/pull
push() {
  if is_jj; then
    jj git push origin
  else
    git push origin
  fi
}
pushf() {
  if is_jj; then
    git push --force-with-lease origin
  else
    git push origin
  fi
}
pull() {
  if is_jj; then
    jj git fetch
  else
    git pull origin
  fi
}
alias gp="git push"
clone() {
  local repo="$1"

  printf "Use jj? (Y/n) "
  read ans
  if [ "$ans" = n ] || [ "$ans" = "N" ]; then
    git clone $repo
  else
    jj git clone $repo
  fi
  cd $(echo $repo | rev | cut -d/ -f1 | cut -d. -f2- | rev)
}
alias stash="git stash"
alias stashp="stash pop"

## checkout
# alias co="git checkout" # replace by script of the same name
com() {
  if is_jj; then
    jj new -r "trunk()"
  else
    git checkout master 2>/dev/null || git checkout main
  fi
}
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
gb() {
  if is_jj; then
    jj log -r "heads(~description('')) | trunk()"
  else
    git branch $@
  fi
}

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
gl() {
  if is_jj; then
    jj log $@
  else
    git log --oneline --graph --decorate --date=relative
  fi
}
alias log="gl"
alias reflog="git reflog"

## diff
gd() {
  if is_jj; then
    jj diff $@
  else
    git diff
  fi
}
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
  if is_jj; then
    jj show $@
  else
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
