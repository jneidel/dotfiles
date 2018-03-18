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
alias gb="git branch"
alias gr="git rebase"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias addcom="git add .; git commit -m"
alias addam="git add .; git commit --amend --no-edit"
alias pushup="git push --set-upstream origin"
alias amendd="git commit --amend --no-edit"
amdate() {
  git commit --amend --date="$1"
}

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
alias test="npm run test"

# tmux
alias tn="tmux new -s"
alias tls="tmux ls"
alias ta="tmux a" # attach
alias tam="tmux a -t main"
alias tac="tmux a -t code"
alias tadb="tmux a -t mongo"

# ls
alias l="ls -lah"      # all files
alias la="ls -l"       # no . files
alias ld="ls -l -d */" # dirs as list

# *.rc files
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias tmuxrc="vim ~/.tmux.conf"
alias eslintrc="vim ~/.eslintrc"
alias al="vim $ZSH/custom/aliases.zsh"

# eslint
alias fix="eslint --fix"
alias fixa="eslint --fix *.js"

# sass
alias sassdir="sass -w . -o ."

# open apps
alias o="open ."   # finder
alias vsc="code ." # vscode

# finder show/hide hidden files
alias showhidden="defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder"

# get/set trackpad speed on mac
alias gettrackpadspeed="defaults read -g com.apple.mouse.scaling"
alias settrackpadspeed="defaults write -g com.apple.mouse.scaling"

# file system
alias cpdir="cp -r"

# misc
alias h="history"
alias homepage="gh-home" # open github repo of current project
alias vimdocs="cd /usr/share/vim/vim80/doc/"
alias ngrok="~/.bin/ngrok" # open tunnel to local port
mdc() { # MkDirCd
  mkdir "$1";
  cd "$1";
}
alias sass="node-sass"

