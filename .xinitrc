#!/bin/sh
# run manually with 'startx'
# run automatically after logging into tty1 through ~/.zshrc

## X settings
# remap caps lock to escape
setxkbmap -option caps:escape &

# set higher keyboard repeat
xset r rate 185 100 &

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
xflux -k 2000 -l 52 -g 13 &

# music player daemon
mpd &

# lock screen
# ~/scripts/i3/lock/autostart-lock

# bar for volume & brightness
mkfifo /tmp/xobpipe
sleep 2; tail -f /tmp/xobpipe | xob &

# desktop monitor
~/scripts/conky/start-conky &

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
# fix permissions for backlight file
# does not work with sudo
# reassign file to root after reboot
#sudo chown jneidel /sys/class/leds/smc::kbd_backlight/brightness
#sudo chown jneidel /sys/class/backlight/intel_backlight/brightness

waitforinternet && mullvad connect &

## autostart gui applications
nice -n -7 kitty ~/scripts/tmux/tp main &
nice -n 19 brave &
nice -n 19 signal-desktop &

# start window manager
exec i3
