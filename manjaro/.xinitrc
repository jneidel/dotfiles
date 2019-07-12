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

# keyboard repeat
xset r rate 185 100 &
# bluelight filter
xflux -k 5000 -l 52 -g 13 &
# hotkeys
sxhkd &
# auto lock screen
xautolock -time 15 -locker blurlock &
# wallpaper
exec nitrogen --restore &
#exec ~/tmp/imgur/update-wallpaper &
exec ~/scripts/conky/start-conky &

kitty ~/scripts/tmux-startup &
firefox-nightly &
mpd &

# status bar
~/scripts/status/i3-lemonbar/run-lemonbar &
# start window manager
exec i3
