# apps

## cli

### programming
alias readme="grip -b 7777" # render readme.md with github styles
alias py="python"
alias color="gcolor2"

### download
alias manga="mangareader-dl --debug"
alias mangaup="manga update --silent 1>> ~/manga/updates 2>&1 &"
alias mangala="manga update check"
alias comic="getcomics-dl"
alias down="cd ~/Downloads; wget -crt 10 -i ~/.wget" # download files in ~/.wget
#### youtube-dl
alias ytdl="youtube-dl --yes-playlist -c --retries 4 -f 'mp4[height=720]' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1"
alias ytmp3="youtube-dl --yes-playlist -c --retries 4 -x --audio-format 'mp3' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1"
alias ytlow="youtube-dl --yes-playlist -c --retries 4 -f 'mp4[height=480]' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1" # dont use for youtube, has no sound
alias ytraw="youtube-dl -c --retries 4 -o '~/Downloads/%(title)s.%(ext)s' $1" # Does not force height, try --write-pages if not working
alias -g PE="--playlist-end"

### misc
alias dict="dict-cc"
alias tree="alder --depth 3" # print filetree
alias flux="xflux -l 52 -g 13" # bluelight filter
alias wifipass="npx wifi-password-cli" # print wifi pass
alias speed="npx speedo-cli"
alias npmup="npm-check-updates"
alias pftp="stftp -u jneidel -p 2121" # $1=IP; pftp for phoneftp
alias webcam='vlc v4l:// :v4l-vdev="/dev/video0"'
alias vv="vlc --audio-desync=-250"

#### gpg
alias gpg1="~/.bin/gpg1/bin/gpg"
alias enc="gpg1 -e -r 7dfd16fa"
alias dec="gpg1 -d"

## gui
alias chrome="chromium"
alias o="xdg-open ." # gui file browser
alias yac="YACReaderLibrary" # manga reader library
alias tordl="cd ~/.bin/tor-browser/Browser/Downloads"

## suffixes
# open files of type x with application y
# usage: $ doc.pdf -> opens in epdfview
alias -s pdf=apvlv #epdfview, mupdf
alias -s epub=FBReader
alias -s mobi=FBReader
alias -s cbz=YACReader
alias -s cbr=YACReader
alias -s jpg=sxiv # or gwenview
alias -s png=sxiv
alias -s mp4=vlc
alias -s mkv=vlc

alias pd="~/.steam/steam/steamapps/common/PAYDAY\ 2/payday2_release"
