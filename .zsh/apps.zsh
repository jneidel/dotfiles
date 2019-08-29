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
alias comic="getcomics-dl"
alias comicup="~/code/getcomics-dl/bin/new.js"
alias down="cd ~/Downloads; wget -crt 10 -i ~/.wget" # download files in ~/.wget

#### youtube-dl
alias ytdl="youtube-dl --yes-playlist -c --retries 4 -f 'mp4[height=720]' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1"
alias ytmp3="youtube-dl --yes-playlist -c --retries 4 -x --audio-format 'mp3' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1"
alias ytlow="youtube-dl --yes-playlist -c --retries 4 -f 'mp4[height=480]' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1" # dont use for youtube, has no sound
alias ytraw="youtube-dl -c --retries 4 -o '~/Downloads/%(title)s.%(ext)s' $1" # Does not force height, try --write-pages if not working
alias -g PE="--playlist-end"

### redefining existing commands
alias cat="bat"
alias scrot="/usr/bin/scrot 'screenshot_%Y-%b-%d_%H:%M:%S.png' -e 'notify-send \"took screenshot\" -t 1000 -i camera;mv \$f ~/pictures'"
alias man="colored-man"

### misc
function dict {
  dict-cc $1 | less
}
alias tree="alder --depth 3" # print filetree, nig @aweary/alder
alias flux="xflux -l 52 -g 13" # bluelight filter
alias wifipass="wifi-pass" # print wifi password
alias speed="npx speedo-cli"
alias npmup="npm-check-updates"
alias pftp="stftp -u jneidel -p 2121" # $1=IP; pftp for phoneftp
alias webcam='vlc v4l:// :v4l-vdev="/dev/video0"'
alias rc="rename-comic"

### newsboat
alias blog="newsboat -u ~/.newsboat/urls-blog -c ~/.newsboat/cache-blog.db --quiet && clear"
alias yt="newsboat -u ~/.newsboat/urls-youtube -c ~/.newsboat/cache-youtube.db --quiet && clear"
alias pod="newsboat -u ~/.newsboat/urls-podcast -c ~/.newsboat/cache-podcast.db --quiet && clear"

alias nbtest="newsboat -u ~/.newsboat/urls-blog -c ~/tmp/cache-blog.db --quiet -l 6 -d ~/tmp/nb-log && clear"

alias q="podqueue"
alias nbd="podboat --autodownload"

### players
alias n="ncmpcpps"

#### mpv
alias mpvo="mpv --profile=overlay"
alias mpvm="mpv --no-audio-display --no-video" # mpv music
alias mpvan="mpv --profile=anime"
alias mpvmv="mpv --profile=movie"

### gpg
alias enc="gpg -e -r 7dfd16fa"
alias dec="gpg -d"

## gui
alias chrome="chromium"
alias o="xdg-open ." # gui file browser
alias tordl="cd ~/.bin/tor-browser/Browser/Downloads"

## tui
alias job="taskell ~/notes/job-applications.md 2> /dev/null"
alias uni="taskell ~/notes/uni-applications.md 2> /dev/null"
alias flat="taskell ~/notes/flat-applications.md 2> /dev/null"

## light versions
alias vim-light="vim -c 'source ~/.vim/colors/light.vim'"
alias vl="vim-light"

