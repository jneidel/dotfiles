# apps

## cli

### programming
alias rreadme="grip -b 7777" # render readme.md with github styles
alias py="python"

### download
alias manga="mangareader-dl" # manga downloader
alias mangaup="manga update -s >> ~/manga/updates &"
alias mangala="manga list -l"
alias torrent="transmission-cli"
alias down="cd ~/Downloads; wget -crt 10 -i ~/.wget" # download files in ~/.wget

#### youtube-dl
alias ytdl="youtube-dl --yes-playlist -c --retries 4 -f 'mp4[height=720]' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1"
alias ytdllow="youtube-dl --yes-playlist -c --retries 4 -f 'mp4' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1"
alias ytmp3="youtube-dl --yes-playlist -c --retries 4 -x --audio-format 'mp3' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1"

### misc
alias dict="dict-cc"
alias tree="alder --depth 3" # print filetree
alias flux="xflux -l 52 -g 13" # bluelight filter
alias wifipass="npx wifi-password-cli" # print wifi pass
alias gdrive="sh ~/.drive/update.sh" # sync google drive, after encrypting the files
alias tod="todoist add --date today" # quick add todoist task
alias f="cd /; fd"

if [ -e ~/.scripts/hhighlighter.sh ]; then
  source ~/.scripts/hhighlighter.sh;
fi
alias -g highlight="| hhighlighter -i"

#### gpg
alias gpg1="~/.bin/gpg1/bin/gpg"
alias enc="gpg1 -e -r 7dfd16fa"
alias dec="gpg1 -d"

#### cmus
alias cpl="cmus-remote -u" # start/stop
alias x="cmus-remote -u"  # start/stop
alias cn="cmus-remote -n" # next
alias cr="cmus-remote -r" # prev

## gui
alias chrome="chromium"
alias o="xdg-open ." # gui file browser
alias yac="YACReaderLibrary" # manga reader library
alias tor="cd ~/.bin/tor-browser"

## suffixes
# open files of type x with application y
# usage: $ doc.pdf -> opens in epdfview
alias -s pdf=epdfview
alias -s epub=FBReader
alias -s mobi=FBReader
alias -s cbz=YACReader
alias -s cbr=YACReader

