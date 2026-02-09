#!/bin/sh
# run manually with 'startx'
# run automatically after logging into tty1 through ~/.zshrc

## X settings
# capslock mod-tap: tap = esc, hold = control
# ö mod-tap: tap = ö, hold = hyper
# setxkbmap -option caps:escape &
sudo kmonad ~/.config/kmonad/mod-tap-mappings.kbd &
{
  sleep 5s; xmodmap /home/jneidel/.config/Xmodmap-remove-Hyper_R; xmodmap ~/.config/Xmodmap
  sleep 15s; xmodmap /home/jneidel/.config/Xmodmap-remove-Hyper_R; xmodmap ~/.config/Xmodmap
} &

# set higher keyboard repeat after kmonad/xmodmap
(sleep 7s && xset r rate 185 100) &
(sleep 17s && xset r rate 185 100) &

# disable annoying system beep
xset -b &

# X styles
xrdb -load "$XDG_CONFIG_HOME/X11/Xresources" &

# Compositor (X shadows and such)
# xcompmgr -c &

# wallpaper
xwallpaper --zoom ~/.config/wallpaper.png &

# hide cursor after 2 sec
unclutter --timeout 2 &

# disable external monitors
monitor off & # xrandr

## daemons & background programs
# hotkeys
sxhkd &

# notifications
nice -n 5 dunst &

# bluelight filter
if [ "$(date +%H)" -ge 18 ]; then
  bluelight start &
else
  xflux -k 3000 -l 52 -g 13 >/dev/null 2>&1 &
fi

# music player daemon
mpd &

# bar for volume & brightness
mkfifo /tmp/xobpipe
(sleep 2; tail -f /tmp/xobpipe | xob &) &

# desktop monitor
~/scripts/conky/start-conky &

# CPU frequency scaling governor
# TODO test whats the minimal required setup. Both uncommented worked.
(sleep 1m; sudo cpupower frequency-set --governor conservative) &
# {
#   sleep 30s
#   if tmux has-session -t main; then
#     tmux -u new-window -d -n "freq" -t main:98
#     tmux send-keys -t main:98 "sudo cpupower frequency-set --governor conservative; exit" "enter"
#   fi
# } &
## systemd service fails on boot, but works once in userspace

# lock the screen on suspend/hibernate
# xss-lock --transfer-sleep-lock ~/scripts/i3/lock/lock &
# lock screen after 5h of inactivity
# xset dpms 0 0 18000
# https://wiki.archlinux.org/title/Session_lock
# https://unix.stackexchange.com/a/639552

# status bar
(sleep 10s; nice -n -10 ~/scripts/lemonbar/run-lemonbar &) &

# doesn't work if started directly
# {
#   sleep 10
#   # conky with local mpd cover
#   ~/scripts/mpd/local-cover &
#   # nitrogen --restore &
# } &

# fix backlight permissions
sudo chown -R jneidel /sys/class/backlight/intel_backlight/brightness &

# fetch new mail to local when it arrives on imap server
(sleep 10s; ~/scripts/mail/watch-imap >/dev/null 2>&1 &) &

# fix cpu frequency
(
  echo passive | sudo tee /sys/devices/system/cpu/intel_pstate/status ; sudo cpupower frequency-set -g userspace
) &

## autostart gui applications
nice -n -7 kitty ~/scripts/tmux/tp main &
nice -n 17 firefox &
nice -n 17 signal-desktop &
nice -n 17 watch-for-deadline-changes &
emacs &

# start window manager
exec i3
