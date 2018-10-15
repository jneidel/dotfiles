# apps

## cli

### programming
alias rreadme="grip -b 7777" # render readme.md with github styles
alias py="python"
alias color="gcolor2"

### download
alias manga="mangareader-dl --debug" # manga downloader
alias mangaup="mangareader-dl update --silent 1>> ~/manga/updates 2>&1 &"
alias mangala="manga update check"
alias down="cd ~/Downloads; wget -crt 10 -i ~/.wget" # download files in ~/.wget
alias comic="getcomics-dl"

#### youtube-dl
alias ytdl="youtube-dl --yes-playlist -c --retries 4 -f 'mp4[height=720]' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1"
alias ytlow="youtube-dl --yes-playlist -c --retries 4 -f 'mp4[height=480]' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1" # dont use for youtube, has no sound
alias ytmp3="youtube-dl --yes-playlist -c --retries 4 -x --audio-format 'mp3' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1"
alias ytraw="youtube-dl -c --retries 4 -o '~/Downloads/%(title)s.%(ext)s' $1"

### misc
alias dict="dict-cc"
alias tree="alder --depth 3" # print filetree
alias flux="xflux -l 52 -g 13" # bluelight filter
alias wifipass="npx wifi-password-cli" # print wifi pass
alias gdrive="sh ~/.drive/update.sh" # sync google drive, after encrypting the files
alias f="cd /; fd"
alias speed="npx speedo-cli"

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
alias -s pdf=apvlv #epdfview
alias -s epub=FBReader
alias -s mobi=FBReader
alias -s cbz=YACReader
alias -s cbr=YACReader
alias -s jpg=sxiv # or gwenview
alias -s png=sxiv
alias -s mp4=vlc
alias -s mkv=vlc

alias pd="~/.steam/steam/steamapps/common/PAYDAY\ 2/payday2_release"
