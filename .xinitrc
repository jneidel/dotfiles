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

# keyboard repeat
xset r rate 185 100 &
# lock screen
xautolock -time 20 -locker blurlock &
# bluelight filter
xflux -k 5000 -l 52 -g 13 &
# desktop monitor
~/scripts/conky/start-conky &
# watch bluetooth devices
~/scripts/bluetooth/bt-watchdog.sh &
# disable external monitors
monitor off &

## daemons
# hotkeys
sxhkd &
# notification
dunst &
# pulseaudio and mpd
/bin/start-pulseaudio-x11 && mpd &

## gui application autostart
kitty ~/scripts/tmux/t &
firefox-nightly &
signal-desktop &

# don't work if started directly
{
  sleep 10
  # mpd cover conky
  # ~/scripts/mpd/local-cover &
  # wallpaper
  nitrogen --restore &
} &

# status bar
~/scripts/lemonbar/run-lemonbar &
# start window manager
exec i3
