#!/bin/sh
# xinitrc
# run from ~/.zshrc after logging into the tty for the first time

# remap caps lock to escape
# does not work via xmodmap without display manager
# see: https://bbs.archlinux.org/viewtopic.php?id=100007
setxkbmap -option caps:escape &

# fix permissions for backlight file
# does not work with sudo
# reassign file to root after reboot
sudo chown jneidel /sys/class/leds/smc::kbd_backlight/brightness
sudo chown jneidel /sys/class/backlight/intel_backlight/brightness

# start pulseaudio
/bin/start-pulseaudio-x11

## keyboard repeat
xset r rate 185 100 &
## hotkeys
sxhkd &
## bluelight filter
xflux -k 5000 -l 52 -g 13 &
## auto lock screen
xautolock -time 15 -locker blurlock &
## desktop monitor
#~/scripts/conky/start-conky &
## terminal
kitty ~/scripts/tmux-startup &
## browser
firefox-nightly &
## wallpaper
exec nitrogen --restore &
#exec ~/tmp/imgur/update-wallpaper &
## status bar
exec ~/scripts/status/i3-lemonbar/run-lemonbar &

# start window manager
exec i3
