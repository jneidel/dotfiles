# apps

## clis
### programming
alias py="python"
alias color="gcolor2"
alias readme="grip -b 7777" # render readme.md with github styles
[ -n "$GH_ACCESS_TOKEN" ] && alias readme="grip -b 7777 --user $USER --pass $GH_ACCESS_TOKEN" # remove rate limit
mdo() {
  FILE="$1"
 if [ -n "$GH_ACCESS_TOKEN" ]; then
  grip "$FILE" -b 7777 --user $USER --pass $GH_ACCESS_TOKEN
 else
   grip "$FILE" -b 7777
 fi
}

### download
alias manga="mangareader-dl --debug"
alias mangaup="manga-update &"
alias mangala="manga update check"
alias mangan="mangala | grep ' - ' && mangaup"
alias comic="getcomics-dl"
alias down="cd ~/Downloads; wget -crt 10 -i ~/.wget" # download files in ~/.wget

#### youtube-dl
alias ytdl="youtube-dl --yes-playlist -c -i --retries 4 -f 'mp4[height=720]' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1"
alias ytmp3="youtube-dl --yes-playlist -c -i --retries 4 -x --audio-format 'mp3' --audio-quality '320K' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1 --write-thumbnail"
alias ytlow="youtube-dl --yes-playlist -c -i --retries 4 -f 'mp4[height=480]' -o '~/Downloads/%(title)s.%(ext)s' $2 $3 $1" # dont use for youtube, has no sound
alias ytraw="youtube-dl -c --retries 4 -o '~/Downloads/%(title)s.%(ext)s' $1" # Does not force height, try --write-pages if not working
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
alias eslint="/bin/eslint --config '$HOME/.config/eslint/eslintrc'"
alias neofetch="/bin/neofetch --os_arch off --cpu_brand off --gtk2 off --gtk3 off --shell_version off --package_managers off --uptime_shorthand tiny --gpu_brand off"
alias npm="/bin/npm -s"

### shorter script names
alias rc="rename-comic"
alias shasum="sha256sum"
alias mt="mullvad-toggle"
alias ht="hosts-toggle"
alias c3="charge3"
alias sc="shellcheck"
alias to="todays-events"
alias open="mimeopen"

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
alias pg="sudo -u postgres"
alias status="journalctl --no-pager -f -u"
alias s-sshd="sudo systemctl start sshd"
alias tspc="tsp -C && tsp"
gh() {
  [ -e "package.json" ] && \
    grep "repository" package.json | awk -F\" '{ print "https://github.com/"$4}' | xargs -r brave >/dev/null 2>&1 &
}

### newsboat
TEXTS=~/scripts/personal/newsboat-texts
SLEEP=12
# new() {
#   shuf -n1 $TEXTS
#   sleep $SLEEP
#   printf "(y/N): "
#   read -r ANS
#   if [ "$ANS" = 'y' ]; then
#     echo "Go ahead..."
#     sleep 1
#   else
#     echo "Good on you, pal."
#   fi
# }
# ma() {
#   shuf -n1 $TEXTS
#   # sleep $SLEEP
#   printf "(y/N): "
#   read -r ANS
#   if [ "$ANS" = 'y' ]; then
#     echo "Go ahead..."
#     sleep 1
#   else
#     echo "Good on you, pal."
#   fi
# }
alias new="newsboat -u ~/.config/newsboat/urls-clean -c ~/.config/newsboat/cache-blog.db --quiet && clear"
alias ma="newsboat -u ~/.config/newsboat/urls-manga -c ~/.config/newsboat/cache-manga.db --quiet && clear"
alias pod="newsboat -u ~/.config/newsboat/urls-pod -c ~/.config/newsboat/cache-pod.db --quiet && clear"
alias mus="newsboat -u ~/.config/newsboat/urls-music -c ~/.config/newsboat/cache-music.db --quiet && clear"
alias q="podqueue"
alias podboat="/bin/podboat -a"

### players
alias n="ncmpcpps"

#### mpv
alias mpvo="mpv --profile=overlay"
alias mpvm="mpv --profile=music"
alias mpvan="mpv --profile=anime"
alias mpvmv="mpv --profile=movie"
alias mpvtest="mpv --input-test --force-window --idle"

### mpd
alias mpdco="mpd-cover"
alias mpdly="mpd-lyrics | $PAGER"
alias ml="mpd-toggle-local"

### gpg
alias enc="gpg -e -r $KEYID"
alias dec="gpg -d"

## gui
alias chrome="chromium"
alias kid="nemo . 2>/dev/null &; kid3 . 2>/dev/null" # gui file browser + kid3
alias pdfe="masterpdfeditor5"

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

## psql
export PGPASSFILE="$HOME/.config/psql/pgpass"

## webtorrent
alias wt="webtorrent -o /tmp --mpv --quiet"
wts() {
  TORRENT="$1"
  SELECT="$2"
  if [ -z "$SELECT" ]; then
    webtorrent "$TORRENT" -o /tmp --quiet -s
  else
    webtorrent "$TORRENT" -o /tmp --mpv --quiet -s "$SELECT" 2>/dev/null
  fi
}
wtsn() {
  TORRENT="$1"
  SELECT="$2"
  webtorrent "$TORRENT" -o /tmp --not-on-top --no-quit -s "$SELECT"
}
