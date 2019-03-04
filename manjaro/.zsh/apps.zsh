# apps

## clis
### programming
alias readme="grip -b 7777" # render readme.md with github styles
alias py="python"
alias color="gcolor2"

### download
alias manga="mangareader-dl --debug"
alias mangaup="manga update --silent 1>> ~/manga/updates 2>&1 &"
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

### misc
function dict {
  dict-cc $1 | less
}
alias tree="alder --depth 3" # print filetree, nig @aweary/alder
alias flux="xflux -l 52 -g 13" # bluelight filter
alias wifipass="npx wifi-password-cli" # print wifi pass
alias speed="npx speedo-cli"
alias npmup="npm-check-updates"
alias pftp="stftp -u jneidel -p 2121" # $1=IP; pftp for phoneftp
alias webcam='vlc v4l:// :v4l-vdev="/dev/video0"'
alias rc="rename-comic"
alias -g R="| entr -cp" # R[UN]
alias q="podqueue"

### newsboat
alias yt="newsboat -u ~/.newsboat/urls-youtube -c ~/.newsboat/cache-youtube.db --quiet && clear"
alias pod="newsboat -u ~/.newsboat/urls-podcast -c ~/.newsboat/cache-podcast.db --quiet && clear"
alias nbd="podboat --autodownload"

### players
alias vv="~/scripts/vv 250"
alias vvv="~/scripts/vv 500"
alias play="mplayer -ao pulse -really-quiet"

### gpg
alias enc="gpg -e -r 7dfd16fa"
alias dec="gpg -d"

## gui
alias chrome="chromium"
alias o="xdg-open ." # gui file browser
alias tordl="cd ~/.bin/tor-browser/Browser/Downloads"

## suffixes
## open files with extension .x with application y
## usage: $ ./doc.cbz -> opens in YACReader
alias -s pdf=apvlv #epdfview, mupdf
alias -s epub=FBReader
alias -s mobi=FBReader
alias -s cbz=YACReader
alias -s cbr=YACReader
alias -s jpg=sxiv # or gwenview
alias -s png=sxiv
alias -s mp4=vlc
alias -s mkv=vlc
alias -s mp3=mplayer
alias -s sh=bash
alias -s js=node
alias -s json=fx
alias -s html=firefox-nightly
alias -s ts=tsc

