# transmission
# based on gotbletu: https://github.com/gotbletu/shownotes/blob/master/transmission-cli.txt
# blocklist: https://www.iblocklist.com/list?list=ydxerpxkpcfqjaybcssw

alias tsm="transmission-remote -l" # list torrents

alias tsmadd="transmission-remote -a" # add torrent
alias tsma="tsmadd"

alias tsmsite="chromium http://localhost:9091" # open transmission site

tsmpause() { transmission-remote -t"$1" --stop; }  # stop id or all
alias tsmp="tsmpause"
tsmstart() { transmission-remote -t"$1" --start; } # start id or all
alias tsms="tsmstart"

tsmrm() { transmission-remote -t"$1" --remove; } # delete torrent
tsmpurge() { transmission-remote -t"$1" --remove-and-delete; } # delete torrent + data
tsminfo() { transmission-remote -t"$1" --info; } # display torrent info
tsmspeed() { while true;do clear; transmission-remote -t"$1" -i | grep Speed;sleep 1;done ; } # display torrent speed
tsmclear() { # remove finished torrents
  transmission-remote -l | grep 100% | grep Done | \
  awk '{print $1}' | xargs -n 1 -I % transmission-remote -t % -r;
}
alias tsmwatch="W transmission-remote -l"
alias tsmw="tsmwatch"
alias tsmdaemon="transmission-daemon -c ~/Downloads"

alias tpb="~/.scripts/tpb.sh" # download from tpb using transmission

