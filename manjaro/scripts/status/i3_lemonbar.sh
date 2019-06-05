#! /bin/bash
#
# I3 bar with https://github.com/LemonBoy/bar

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

. "$DIR/i3_lemonbar_config"

if [ $(pgrep -cx "i3_lemonbar.sh") -gt 1 ]; then
    printf "%s\n" "The status bar is already running." >&2
    exit 1
fi

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

[ -e "${panel_fifo}" ] && rm "${panel_fifo}"
mkfifo "${panel_fifo}"

### EVENTS METERS

# i3 Workspaces, "WSP"
# TODO : Restarting I3 breaks the IPC socket con. :(
sleep 1 && "$DIR/i3_workspaces.pl" > "${panel_fifo}" &

# Conky, "SYS"
conky -c "$DIR/i3_lemonbar_conky" > "${panel_fifo}" &

journalctl -u mullvad-daemon -u NetworkManager --no-pager -f -o cat | grep -f "$DIR/i3_lemonbar_network_patterns" -o --line-buffered | "$DIR/i3_lemonbar_network" > "${panel_fifo}" &

#### LOOP FIFO

cat "${panel_fifo}" | "$DIR/i3_lemonbar_parser.sh" \
  | lemonbar -p -f "${font}" -b -g "${geometry}" -B "${col_back}" -F "${col_back}" &

wait

