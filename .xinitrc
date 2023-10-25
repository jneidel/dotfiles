#!/bin/sh
# run manually with 'startx'
# run automatically after logging into tty1 through ~/.zshrc

## X settings
# remap caps lock to escape
# setxkbmap -option caps:escape &
# remap caps lock to mod-tap with esc as tap and ctrl as hold
sudo kmonad ~/.config/kmonad/caps_as_ctrl_esc.kbd &

# set higher keyboard repeat after kmonad
sleep 1s && xset r rate 185 100 &

# disable annoying system beep
xset -b &

# X styles
xrdb -load "$XDG_CONFIG_HOME/X11/Xresources" &

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
xflux -k 3000 -l 52 -g 13 &

# music player daemon
mpd &

# bar for volume & brightness
mkfifo /tmp/xobpipe
sleep 2; tail -f /tmp/xobpipe | xob &

# desktop monitor
~/scripts/conky/start-conky &

# lock the screen on suspend/hibernate
xss-lock --transfer-sleep-lock ~/scripts/i3/lock/lock &
# lock screen after 5h of inactivity
xset dpms 0 0 18000
# https://wiki.archlinux.org/title/Session_lock
# https://unix.stackexchange.com/a/639552

# status bar
nice -n -10 ~/scripts/lemonbar/run-lemonbar &

# doesn't work if started directly
# {
#   sleep 10
#   # conky with local mpd cover
#   ~/scripts/mpd/local-cover &
#   # nitrogen --restore &
# } &

# fix backlight permissions
sudo chown -R jneidel /sys/class/backlight/intel_backlight/brightness &

# disable mullvad lockdown-mode if active
mullvad lockdown-mode set off &

# fix cpu frequency
(
  echo passive | sudo tee /sys/devices/system/cpu/intel_pstate/status ; sudo cpupower frequency-set -g userspace
) &

## autostart gui applications
nice -n -7 kitty ~/scripts/tmux/tp main &
nice -n 19 brave &
nice -n 19 signal-desktop &

nice -n 19 watch-for-deadline-changes &

# start window manager
exec i3
