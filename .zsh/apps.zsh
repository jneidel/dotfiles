# apps

## clis
### programming
alias readme="grip -b 7777" # render readme.md with github styles
alias py="python"
alias color="gcolor2"

### download
alias manga="mangareader-dl --debug"
alias mangaup="manga-update &"
alias mangala="manga update check"
alias mangan="mangala | grep ' - ' && mangaup"
alias comic="getcomics-dl"
alias down="cd ~/Downloads; wget -crt 10 -i ~/.wget" # download files in ~/.wget

#### youtube-dl
alias ytdl="youtube-dl --yes-playlist -c --retries 4 -f 'mp4[height=720]' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1"
alias ytmp3="youtube-dl --yes-playlist -c --retries 4 -x --audio-format 'mp3' --audio-quality '320K' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1"
alias ytlow="youtube-dl --yes-playlist -c --retries 4 -f 'mp4[height=480]' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1" # dont use for youtube, has no sound
alias ytraw="youtube-dl -c --retries 4 -o '~/Downloads/%(title)s.%(ext)s' $1" # Does not force height, try --write-pages if not working
alias ytstream="youtube-dl --format 'mp4' -o - '$1' | mpv -"
alias -g PE="--playlist-end"

### redefining existing commands
alias cat="bat"
alias ccat="/bin/cat"
alias scrot="~/scripts/sxhkd/screenshot"
alias scrott="~/scripts/sxhkd/screenshot -s 5"
alias man="colored-man"
alias vim="nvim $@ 2>/dev/null"
alias v="vim"
alias vvim="/bin/vim"
alias ex="extract"
alias grep="/bin/grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
alias mkdir="/usr/bin/mkdir -p"
alias glow="/bin/glow -s dark"
alias cal="/bin/cal -m"
alias scp="echo use sscp instead; echo"
alias vdirsyncer="vdirsyncer -c ~/.config/vdirsyncer/config"
alias webtorrent="/bin/webtorrent --mpv"
alias eslint="/bin/eslint --config '$HOME/.config/eslint/eslintrc'"

### shorter script names
alias rc="rename-comic"
alias shasum="sha256sum"
alias mt="mullvad-toggle"
alias ht="hosts-toggle"
alias c3="charge3"
alias sc="shellcheck"
alias to="todays-events"

### misc
function dict {
  dict-cc $1 | less
}
alias tree="alder --depth 3" # print filetree, nig @aweary/alder
alias flux="xflux -l 52 -g 13" # bluelight filter
alias speed="npx speedo-cli"
alias npmup="npm-check-updates"
alias webcam='vlc v4l:// :v4l-vdev="/dev/video0"' # webcam has to be configured
alias cal6="cal -mn 6"
alias g="grep"
alias gw="./gradlew"

### newsboat
alias new="newsboat -u ~/.config/newsboat/urls-clean -c ~/.config/newsboat/cache-blog.db --quiet && clear"
alias q="podqueue"
alias podboat="/bin/podboat -a"

### players
alias n="ncmpcpps"

#### mpv
alias mpvo="mpv --profile=overlay"
alias mpvm="mpv --no-audio-display --no-video" # mpv music
alias mpvan="mpv --profile=anime"
alias mpvmv="mpv --profile=movie"

### mpd
alias mpdco="mpd-cover"
alias mpdly="mpd-lyrics | $PAGER"

### gpg
alias enc="gpg -e -r 7dfd16fa"
alias dec="gpg -d"

## gui
alias chrome="chromium"
alias kid="nemo . 2>/dev/null &; kid3 . 2>/dev/null" # gui file browser + kid3
alias tordl="cd ~/.bin/tor-browser/Browser/Downloads"

## tui
alias job="taskell ~/code/notes/taskell/job-applications.md 2> /dev/null"
alias flat="taskell ~/code/notes/taskell/flat-applications.md 2> /dev/null"
alias sec="watch -t -n 1 figlet-clock"

## light versions
alias vim-light="vim -c 'source ~/.vim/colors/light.vim'"
alias vl="vim-light"

## brightness
alias bright="backlight"
alias max="bright max N1"
alias min="bright min N1"
alias half="bright p 50 N1"

## cat updates files
alias mup="show-updates manga"
alias cup="show-updates comic"
