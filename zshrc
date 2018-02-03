### Zsh Options

USER_DIR="/Users/jneidel"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ZSH=$USER_DIR/.oh-my-zsh
ZSH_THEME="cobalt2"

HIST_STAMP="dd.mm.yyyy"
CASE_SENSITIVE="true"

plugins=( zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

export PATH=/opt/local/bin:/sw/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$USER_DIR/.vimpkg/bin

### Optional Apps

#source /sw/bin/init.sh # Setup fink path

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# set pastetoggle=<F5>

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
alias diff="git diff"
alias com="git checkout master"

# npm
alias ni="npm install"
alias nid="npm install --save-dev"
alias nu="npm uninstall"
alias nr="npm run"
alias start="npm run start"
alias build="npm run build"
alias test="npm run test"
alias testing="npm run testing"
alias npmlist="npm list -g --depth=0"

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
alias tmuxrc="vim ~/.tmux.conf"

# Misc shortcuts
alias o="open ."
alias vsc="code ."
alias python3="~/anaconda/bin/python3.6"
alias fix="eslint --fix"
alias fixa="eslint --fix *.js"
alias n="vim ~/notes/notes"
alias m="cd ~/Programming/misc/contents/"
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
alias ytmp3="youtube-dl --config-location /Users/jneidel/.config/youtube-dl/youtube-dl.conf $2 $3 $1"
alias ytunder="python3 /Users/jneidel/.utilities/underscore.py"
alias ytdown="youtube-dl --yes-playlist --retries 4 -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1"
alias stats="iostat -w 1"
alias vimdocs="cd /usr/share/vim/vim80/doc/ "
alias readme="grip -b 7777"
alias gettrackpadspeed="defaults read -g com.apple.mouse.scaling"
alias settrackpadspeed="defaults write -g com.apple.mouse.scaling"
alias ngrok="~/.bin/ngrok"
mkdircd() {
  mkdir "$1";
  cd "$1";
}
alias sass="node-sass"
alias dlog='{ echo "--"; date +%d.%m.%Y; echo "--"; } | tr "\n" " " >> ~/notes/log; vim ~/notes/log;'
alias elog="vim ~/notes/log"

# dotfiles
dotfiles() {
  cp ~/.zshrc ~/Programming/dotfiles/zshrc;
  cp ~/.vimrc ~/Programming/dotfiles/vimrc; 
  cp ~/.eslintrc ~/Programming/dotfiles/eslintrc;  
  cp ~/.tmux.conf ~/Programming/dotfiles/tmux.conf;
  cp $ZSH/oh-my-zsh.sh ~/Programming/dotfiles/oh-my-zsh.sh;
}

#####################################
bindkey "^[," copy-prev-word
bindkey "^[-" copy-prev-word

