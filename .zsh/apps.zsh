# apps

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
alias comic="getcomics-dl"
alias down="cd ~/Downloads; wget -crt 10 -i ~/.wget" # download files in ~/.wget

#### youtube-dl
local ytdl_location=$HOME/Downloads/fs/media
alias ytdl="yt-dlp --yes-playlist -c -i --retries 4 -f 'mp4[height=720]' -o '$ytdl_location/%(title)s.%(ext)s'"
alias ytmp3="yt-dlp --yes-playlist -c -i --retries 4 -x --audio-format 'mp3' --audio-quality '320K' -o '$ytdl_location/%(title)s.%(ext)s' --embed-thumbnail"
alias ytraw="yt-dlp -c --retries 4 -o '$ytdl_location/%(title)s.%(ext)s'" # Does not force height, try --write-pages if not working
alias ythere="yt-dlp -c -i --retries 4 -f 'mp4[height=720]' -o './%(title)s.%(ext)s'"
alias yt3="yt-dlp --yes-playlist -c -i --retries 4 -x --audio-format 'mp3' --audio-quality '320K' -o './%(title)s.%(ext)s' --embed-thumbnail"
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
alias grep="/bin/grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
alias mkdir="/usr/bin/mkdir -p"
alias glow="/bin/glow -s dark"
alias cal="/bin/cal -m"
alias vdirsyncer="vdirsyncer -c ~/.config/vdirsyncer/config"
alias eslint="/bin/eslint --config '$HOME/.config/eslint/eslintrc'"
alias neofetch="/bin/neofetch --os_arch off --cpu_brand off --gtk2 off --gtk3 off --shell_version off --package_managers off --uptime_shorthand tiny --gpu_brand off"
alias ani-cli="/bin/ani-cli -q 720"
yay() {
  if [ -z "$1" ]; then
    nice /bin/yay --overwrite /usr/lib/node_modules/\* -Syu
  else
    nice /bin/yay $@
  fi
}
alias mv="/bin/mv -v"
alias pubs="/bin/pubs -c ~/.config/pubs/pubsrc"
alias ffmpeg="/bin/ffmpeg -hide_banner"

### shorter script names
alias rc="rename-comic"
alias shasum="sha256sum"
alias mt="mullvad-toggle"
alias ht="hosts-toggle"
alias sc="shellcheck"
alias to="todays-events"
alias scim="sc-im" # guide: https://www.youtube.com/watch?v=K_8_gazN7h0
alias sw="date +'%a %b %d'; raw-stopwatch"
alias license="legit put gpl-3.0"

### misc
function dict {
  dict-cc $1 | less
}
alias tree="alder --depth 3" # print filetree, nig @aweary/alder
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
alias bud="libreoffice ~/ct/reference/budget.ods &"
alias mr="~/code/mangareader-dl/dist/bin/cli.js d -o ~/ct/manga -p mangalife"
alias ms="mullvad status"

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
nomoreent() {
  # echo "No youtube and gaming entertainment for now"
  # return 1

  local WEEKDAY=`date +%a`
  local HOUR=`date +%H`
  # if [ "$WEEKDAY" != "Sun" ] && [ "$WEEKDAY" != "Sat" ]; then
  #   if [ "$HOUR" -lt 18 ] && [ "$HOUR" -gt 4 ]; then
  #     echo "It's not the right time."
  #     return
  #   fi
  # fi
  local NAME="ent"
  out=$(mktemp)
  if ! newsboat -u ~/.config/newsboat/urls-$NAME -c ~/.config/newsboat/cache-$NAME.db --quiet; then
    echo 'didnt you want to finish dune first?'; return
    newsboat -u ~/.config/newsboat/urls-$NAME -c ~/.config/newsboat/cache-$NAME.db >$out
    # newsboat -u ~/.config/newsboat/urls-$NAME -c ~/.config/newsboat/cache-$NAME.db -C ~/.config/newsboat/config-ent >$out
    echo "Waiting for reload-newsboat to finish"
    tail --pid=`grep -Po "PID: \K\d+" $out` -f /dev/null && newsboat -u ~/.config/newsboat/urls-$NAME -c ~/.config/newsboat/cache-$NAME.db --quiet && clear
  fi
}
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
alias mpyt="mpv --profile=yt"

### mpd
alias mpdco="mpd-cover"
alias mpdly="mpd-lyrics | $PAGER"
alias ml="mpd-toggle-local"
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
alias wt="webtorrent -o /tmp --mpv --quiet"
alias wtc="xclip -o -sel clip | xargs webtorrent -o /tmp --mpv --quiet " # wtc[lipboard]
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

## remind
alias mc="clear && rem -b1 -c+u2 -m -@2,0 2>/dev/null"
alias mcm="clear && rem -b1 -c+u4 -m -@2,0 2>/dev/null"
alias mcmm="clear && rem -b1 -c+u6 -m -@2,0 2>/dev/null"
alias mc4=mcm
alias mc6=mcmm
alias mc8="clear && rem -b1 -c+u8 -m -@2,0 2>/dev/null"
alias mc12="clear && rem -b1 -c+u12 -m -@2,0 2>/dev/null"
alias mc14="clear && rem -b1 -c+u14 -m -@2,0 2>/dev/null"
alias mc16="clear && rem -b1 -c+u16 -m -@2,0 2>/dev/null"
alias mce='rem -b1 -c+u2 -m -@2,0 2>&1 | grep -ve "│" -e "trigger" -e "┬" -e "┼" -e "┴"'
alias to="rem 2>/dev/null | grep -v Reminders"

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

## make
alias m="make"
alias mw="make watch"

lfcd() {
  # source: https://github.com/gokcehan/lf/wiki/Tutorial#working-directory
  tmp="$(mktemp)"
  $HOME/.config/lf/lfuberzug -last-dir-path="$tmp" "$@"
  if [ -f "$tmp" ]; then
    dir="$(cat "$tmp")"
    rm -f "$tmp"
    if [ -d "$dir" ]; then
      if [ "$dir" != "$(pwd)" ]; then
        cd "$dir"
      fi
    fi
  fi
}
alias lf="lfcd"
