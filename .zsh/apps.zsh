# apps

alias h="cd; clear"
alias dl="cd ~/Downloads; ls"

## clis
### programming
alias py="python"
alias color="gcolor2"
alias readme="grip -b 7777" # render readme.md with github styles
# [ -n "$GH_ACCESS_TOKEN" ] && alias readme="grip --browser --user $USER --pass $GH_ACCESS_TOKEN" # remove rate limit
md() {
  FILE="$1"
 if [ -n "$GH_ACCESS_TOKEN" ]; then
  grip "$FILE" -b 7777 --user $USER --pass $GH_ACCESS_TOKEN
 else
   grip "$FILE" -b 7777
 fi
}
alias great="timeout 5 grip --browser --user $USER --pass $GH_ACCESS_TOKEN /home/jneidel/code/notes/great-books.md >/dev/null 2>&1 &"
alias greata="grip --browser --user $USER --pass $GH_ACCESS_TOKEN /home/jneidel/code/notes/great-books.md >/dev/null 2>&1"

### download
alias manga="mangareader-dl --debug"
alias mangaup="manga-update &"
alias mangala="manga update check"
alias mangan="mangala | grep ' - ' && mangaup"
alias down="cd ~/Downloads; wget -crt 10 -i ~/.wget" # download files in ~/.wget

#### youtube-dl
local ytdl_location=$ORG_INBOX
alias ytdl="nice yt-dlp --yes-playlist -c -i --retries 4 -f 'mp4[height<=1080]' -o '$ytdl_location/%(title)s.%(ext)s'"
alias ytmp3="nice yt-dlp --yes-playlist -c -i --retries 4 -x --audio-format 'mp3' --audio-quality '320K' -o '$ytdl_location/%(title)s.%(ext)s' --embed-thumbnail"
alias ytraw="nice yt-dlp -c --retries 4 -o '$ytdl_location/%(title)s.%(ext)s'" # Does not force height, try --write-pages if not working
alias ythere="nice yt-dlp -c -i --retries 4 -f 'mp4[height=1080]' -o './%(title)s.%(ext)s'"
alias yt3="nice yt-dlp --yes-playlist -c -i --retries 4 -x --audio-format 'mp3' --audio-quality '320K' -o './%(title)s.%(ext)s' --embed-thumbnail"
alias -g PE="--playlist-end"

### redefining existing commands
alias cat="bat"
alias ccat="/bin/cat"
alias scrot="~/scripts/sxhkd/screenshot"
alias scrott="~/scripts/sxhkd/screenshot -s 5"
alias man="colored-man"
alias v="vim"
alias nvim="vim"
alias vvim="/bin/vim"
alias ex="extract"
alias grep="$(where grep | grep -v 'alias' | head -n1) --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
alias mkdir="$(where mkdir | tail -n1) -p"
alias glow="/bin/glow -s dark"
if [ "$(uname)" != "Darwin" ]; then
  alias cal="/bin/cal -m"
fi
alias vdirsyncer="vdirsyncer -c ~/.config/vdirsyncer/config"
alias eslint="/bin/eslint --config '$HOME/.config/eslint/eslintrc'"
alias neofetch="/bin/neofetch --os_arch off --cpu_brand off --gtk2 off --gtk3 off --shell_version off --package_managers off --uptime_shorthand tiny --gpu_brand off"
alias ani-cli="/bin/ani-cli -q 720"
yay() {
  if [ -z "$1" ]; then
    nice up
  else
    nice /bin/yay $@
  fi
}
alias mv="/bin/mv -v"
alias pubs="/bin/pubs -c ~/.config/pubs/pubsrc"
alias ffmpeg="/bin/ffmpeg -hide_banner"
lf() {
  # doing this through an alias is necessary for being
  # able to open a split pane in the same cwd as lf
  local cleanup() {
    exec 3>&-
    rm "$FIFO_UEBERZUG"
  }

  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    lf "$@"
  else
    [ ! -d "$HOME/.cache/lf" ] && mkdir -p "$HOME/.cache/lf"
    export FIFO_UEBERZUG="$HOME/.cache/lf/ueberzug-$$"
    [ -e "$FIFO_UEBERZUG" ] && rm "$FIFO_UEBERZUG"
    mkfifo "$FIFO_UEBERZUG"
    (ueberzug layer -s <"$FIFO_UEBERZUG" -p json &)
    exec 3>"$FIFO_UEBERZUG"
    trap cleanup EXIT

    if [ -e "/bin/lf" ]; then
      command /bin/lf "$@" 3>&-
    elif [ -e "/usr/bin/lf" ]; then
      command /usr/bin/lf "$@" 3>&-
    elif [ -e "/usr/local/bin/lf" ]; then
      command /usr/local/bin/lf "$@" 3>&-
    fi
  fi
}

### shorter script names
alias rc="rename-comic"
alias shasum="sha256sum"
alias mt="mullvad-toggle"
alias ht="hosts-toggle"
alias scim="sc-im" # guide: https://www.youtube.com/watch?v=K_8_gazN7h0
alias sw="date +'%a %b %d'; raw-stopwatch"
alias license="legit put gpl-3.0"
alias fcrontabe="fcrontab -e"
alias sig="signal-name-resolution-failure inbox"
alias mi="mediainfo"
alias bl="bluelight"
alias idea="list-idea"

### misc
function dict {
  dict-cc $1 | less
}
# alias tree="alder --depth 3" # print filetree, nig @aweary/alder
alias flux="xflux -l 52 -g 13" # bluelight filter
alias speed="npx speedo-cli"
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
alias wcurl="curl -OJ" # better wget
alias mr="disable-mullvad-for node ~/code/mr/dist/bin/cli.js d -o $ORG_MEDIA/manga -p mangalife"
ms() {
  is-mullvad && printf "\033[1;32mlockdown-mode is on\033[0m\n" || printf "\033[1;31mlockdown-mode set off\033[0m\n"
  mullvad status
}
alias mre="mullvad disconnect && mullvad connect"
sentix() {
  curl -Ss "https://www.sentix.de/index.php/sentix-News/" |
    grep -Po '\K/index.php\?option=com_rokdownloads&amp;view=file.+?(?=")' -m1 |
    awk '{ print "https://www.sentix.de"$1 }' | xargs $B
}
alias pdfcombine="pdfunite"

### newsboat
wait_for_newsboat() {
  local NAME="$1"
  out=$(mktemp)
  if ! newsboat -u ~/.config/newsboat/urls-$NAME -c ~/.config/newsboat/cache-$NAME.db --quiet; then
    newsboat -u ~/.config/newsboat/urls-$NAME -c ~/.config/newsboat/cache-$NAME.db >$out
    echo "Waiting for reload-newsboat to finish"
    tail --pid=`grep -Po "PID: \K\d+" $out` -f /dev/null && newsboat -u ~/.config/newsboat/urls-$NAME -c ~/.config/newsboat/cache-$NAME.db --quiet && clear
  fi
}
alias new="wait_for_newsboat clean"
alias pod="wait_for_newsboat pod"
alias misc="wait_for_newsboat misc"
alias ma="wait_for_newsboat manga"
alias q="podqueue"
alias podboat="/bin/podboat -a"

### players
alias nc="ncmpcpps"

#### mpv
alias mpvo="mpv --profile=overlay"
alias mpvm="mpv --profile=music"
alias mpvan="mpv --profile=anime"
alias mpvmv="mpv --profile=movie"
alias mpvtest="mpv --input-test --force-window --idle"
alias mpyt="mpv --profile=yt"

### mpd
alias mpdco="mpd-cover"
alias mpdly="mpd-lyrics | $PAGER"
alias lt="mpd-toggle-local"
alias rt="mpd-toggle-local"

### gpg
alias enc="gpg -er $KEYID"
alias dec="gpg -d"
alias encs="gpg -c" # enc symmetric
alias encsk="gpg -cer $KEYID" # enc symmetric key

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

## vnstat
alias vnstatq="vnstat --query wlp3s0"

## webtorrent
alias wt="webtorrent -o /tmp --mpv"
alias wtc="xclip -o -sel clip | xargs webtorrent -o /tmp --mpv" # wtc[lipboard]
wts() {
  TORRENT="$1"
  SELECT="$2"
  if [ -z "$SELECT" ]; then
    webtorrent "$TORRENT" -o /tmp --quiet -s
  else
    webtorrent "$TORRENT" -o /tmp --mpv --quiet -s "$SELECT" 2>/dev/null
    # --not-on-top
  fi
}

## nvim
alias luamake=/home/jneidel/.local/share/nvim/lua-language-server/3rd/luamake/luamake

## pubs, bib ba
alias bb="/bin/pubs -c ~/projects/uni/z_ba/pubs/pubsrc"
bbd() {
  bb doc open "$1" >/dev/null 2>/dev/null
}
alias bbdoc="bbd"
alias bbn="bb note"
alias bbnote="bbn"
bbo() {
  local citekey="$1"
  if [ -z "$citekey" ]; then
    echo "Pass a citekey"
    return 1
  fi
  bbd "$citekey"
  bbn "$citekey"
}
alias bbopen="bbo"
alias bbl="bb list"

n() {
  note="$@"
  if [ -z "$note" ]; then
    gen-note $ORG_INBOX
  else
    printf "Provide a name for this note: "
    read ans
    local filename="$ORG_INBOX/$(echo $note | sed 's|/| |g' | cut -c-60)….norg"
    if [ -n "$ans" ]; then
      filename="$ORG_INBOX/$ans"
    fi

    echo "$note" >$filename
    echo "Wrote to $filename"
  fi
}

ssm() { # cd into currently playing mpd album
  ALBUM=`dirname "$(mpc-get file)"`
  source ~/scripts/mpd/shared-mpd-variables

  if [ "$IS_SERVER" -eq 1 ]; then
    DIR="usb/music/$ALBUM"
    ssh pi -t "cd '$DIR'; zsh"

    exit 0
  else
    DIR="$ORG_MEDIA/music/$ALBUM"
    cd $DIR
  fi
}

tere() {
  local result=$(command tere --filter-search "$@")
  [ -n "$result" ] && cd -- "$result"
}

reflux() {
  fkill xflux
  xflux -k 3000 -l 52 -g 13
}

dot() {
  cd dotfiles
  make import
  clear
  s
}

alias mpr="mpd-toggle-local"
alias mph="(mpv --socket-name music http://192.168.178.69:9111 >/dev/null 2>/dev/null &)"
alias ho="ssh home"

format() {
  # what is this format?
  curl "https://format.wtf/?q=$1" -H Accept:text/x-ansi
}

inbox-leerung() {
  tmux -u new-window -n "inbox" -t main
  tmux send-keys -t main "clear && ~/scripts/org/inbox-leerung" "Enter"
}

cputemp() {
  cat /sys/class/thermal/thermal_zone*/temp | tr '\n' + | sed 's|+$||' | xargs -I@ node -e "console.log( ((@)/4/1000).toFixed(1) + '°C' )"
}

_complete_gamechanger() {
  local files=($(gamechanger print_completions))
  compadd -a files
}
compdef _complete_gamechanger gamechanger

_complete_post() {
  local categories=(newsletter review essay dev guide project recipe misc)
  compadd -a categories
}
compdef _complete_post post

_complete_bl() {
  local cmds=(start stop)
  compadd -a cmds
}
compdef _complete_bl bl
