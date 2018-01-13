### Zsh Options

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ZSH=/Users/jneidel/.oh-my-zsh
ZSH_THEME="cobalt2"

HIST_STAMP="dd.mm.yyyy"

plugins=( zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

export PATH=/sw/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/jneidel/.vimpkg/bin

### Optional Apps

#source /sw/bin/init.sh # Setup fink path

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### Aliases

# Git
alias s="git status"
alias add="git add .; git status"
alias ga="git add"
alias commit="git commit -m"
alias amend="git commit --amend"
alias push="git pull origin master; git push origin"
alias pushf="git push -f origin"
alias master="git pull origin master; git push origin master"
alias pull="git pull origin master; git pull origin"
alias log="git log --oneline --graph"
alias re="git reset"

# npm
alias ni="npm install"
alias nid="npm install --save-dev"
alias nu="npm uninstall"
alias nr="npm run"
alias start="npm run start"
alias build="npm run build"
alias test="npm run test"
alias testing="npm run testing"

# tmux
alias tn="tmux new -s"
alias tls="tmux ls"
alias ta="tmux a"
alias tam="tmux a -t main"
alias tac="tmux a -t code"
alias tadb="tmux a -t mongodb"

# ls
alias l="ls -lah"
alias lsd="ls -l -d */"  	#      dirs as list
alias lss="ls -l - d *" 	# files of sub dirs

# node
alias n="node"
alias n8="nvm use 8.1.4"
alias n9="nvm use 9.2.0"

# itunes
alias play="itunes play --exit"
alias pause="itunes pause --exit"
alias next="itunes next --exit"
alias prev="itunes previous --exit"
alias monstercat="itunes search monstercat
	exit"
alias playlist="itunes search"

# Wifi
alias wifion="osx-wifi-cli on"
alias wifioff="osx-wifi-cli off"
alias wifire="osx-wifi-cli restart"
alias wifipass="osx-wifi-cli pass"
alias wifi="osx-wifi-cli"
alias wifiscan="osx-wifi-cli scan"

# .*rc alias
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"

# Misc shortcuts
alias o="open ."
alias vsc="code ."
alias python3="~/anaconda/bin/python3.6"
alias fix="eslint --fix"
alias fixa="eslint --fix *.js"
alias m="z misc"
alias vnotes="vim ~/Programming/misc/contents/vim.md"
alias uber="ssh jneidel@shaula.uberspace.de"
alias src="source ~/.zshrc"
alias showhidden="defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder"
alias music-dl="instantmusic -s"
alias overlay="open-pip"
overlayyt() {
	ytdl --print-url --filter-container=mp4 "$1" | open-pip
}
popup() {
	website-popup "$1" --size=600x400
}
popups() {
        website-popup https://"$1" --size=600x400
}
alias tree="alder --depth 3"
gh() {
	ghcal -u jneidel -s "1 '$1' 2017" -e "1 '$1' 2018"
}
alias h="history"
alias homepage="gh-home"
alias manga="~/anaconda/bin/python3.6 ~/Programming/mangareader-dl/mangareader-dl.py $1"
alias yt-mp3="youtube-dl --config-location /Users/jneidel/.config/youtube-dl/youtube-dl.conf $2 $3 $1"
alias ytunder="python3 /Users/jneidel/.utilities/underscore.py"
alias stats="iostat -w 1"
alias vimdocs="cd /usr/share/vim/vim80/doc/ "
alias readme="grip -b 7777"
alias gettrackpadspeed="defaults read -g com.apple.mouse.scaling"
alias settrackpadspeed="defaults write -g com.apple.mouse.scaling"

# dotfiles
dotfiles() {
  cp ~/.zshrc ~/Programming/dotfiles/zshrc;
  cp ~/.vimrc ~/Programming/dotfiles/vimrc; 
  cp ~/.eslintrc ~/Programming/dotfiles/eslintrc;  
  cp ~/.tmux.conf ~/Programming/dotfiles/tmux.conf;
}

