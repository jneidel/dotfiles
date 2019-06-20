# transmission aliases
## based on gotbletus setup: https://github.com/gotbletu/shownotes/blob/master/transmission-cli.txt
## blocklist: https://www.iblocklist.com/list?list=ydxerpxkpcfqjaybcssw

# tsr is a tsr wrapper, which starts the daemon if it's not already running
alias tsm="tsr -l" # list torrents

alias tsmadd="tsr -a" # add torrent
alias tsma="tsmadd"

tsmpause() { tsr -t"$1" --stop; }  # stop id or all
alias tsmp="tsmpause"

tsmstart() { tsr -t"$1" --start; } # start id or all
alias tsms="tsmstart"

tsminfo() { # display torrent info
  tsm -t $1 -i G -P "Name:|Total size:|Downloaded:|Peers:"
}
alias tsmi="tsminfo"
# tsminfo() { tsr -t"$1" --info; } # has a lot more information

tsmrm() { tsr -t"$1" --remove; } # delete torrent
tsmpurge() { tsr -t"$1" --remove-and-delete; } # delete torrent + data

alias tsmwatch="watch -t -n .7 tsr -l" # watch mode, updating 'tsm'
alias tsmw="tsmwatch"

alias tsmdone='tsm G "Done" G -v "None" G -v "ETA" HL "done"' # list finished torrents
alias tsmd="tsmdone"

alias tsmc="transmission-clear"

alias tsmsite="$BROWSER http://localhost:9091" # open transmission site

alias tsmdaemon="transmission-daemon -c ~/Downloads" # start daemon

tsmget() {
  tsr -t $1 # add -G, -g depending on whenever or not to get
}
alias tsmg="tsmget"

