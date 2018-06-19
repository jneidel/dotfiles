### Aliases

alias src="source ~/.zshrc"

alias v="vim"

# git
alias s="git status"
alias add="git add .; git status"
alias ga="git add"
alias commit="git commit -m"
alias amend="git commit --amend"
alias push="git push origin"
alias pushf="git push -f origin"
alias pull="git pull origin"
alias master="git pull origin master; git push origin master"
alias log="git log --oneline --graph --decorate"
alias reflog="git reflog"
alias re="git reset"
alias diff="git diff"
alias co="git checkout"
alias com="git checkout master"
alias addcom="git add .; git commit -m"
alias addam="git add .; git commit --amend --no-edit"
alias pushup="git push --set-upstream origin"
alias amendd="git commit --amend --no-edit"

# npm
alias ni="npm install"
alias nid="npm install --save-dev"
alias nig="npm install -g"
alias nu="npm uninstall"
alias nug="npm uninstall -g"
alias npmls="npm list -g --depth=0"
alias nr="npm run"
alias start="npm run start"
alias build="npm run build"

# tmux
alias tn="tmux new -s"
alias tls="tmux ls"
alias ta="tmux a -t" # attach
alias tam="tmux a -t main"

# ls
alias l="ls -1aFG"    # all files
alias la="ls -1FG"    # no . files
alias ld="ls -1Gd */" # only dirs
alias li="ls -lahoFG" # more info

# *.rc files
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias tmuxrc="vim ~/.tmux.conf"
alias muttrc="vim ~/.neomuttrc"
alias al="vim $ZSH/custom/aliases.zsh"

# file system
alias cpdir="cp -r"
mdc() { # MkDirCd
  mkdir "$1";
  cd "$1";
}

# misc
alias h="history"
calc() {
  echo "$1" | bc
}
alias calendar="cal -NA 3"
alias cal3="cal -NC3"
alias home="cd;clear;"
alias shuffle="shuf -i 1-6 -n 1"

# gpg
alias gsig="gpg --list-sigs"

# mail
alias f="fetchmail -a"
alias m="neomutt"
alias marchive="neomutt -f ~/Mail/archive"
alias msent="neomutt -f ~/Mail/sent"
alias mnews="neomutt -f Mail/news"
alias minvoices="neomutt -f Mail/invoices"
alias moutlook="neomutt -f Mail/outlook"

