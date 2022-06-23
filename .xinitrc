#!/bin/sh
# xinitrc
## run manually with 'startx'
## run automatically after logging into tty1 through ~/.zshrc

# remap caps lock to escape
# does not work via xmodmap without display manager
# see: https://bbs.archlinux.org/viewtopic.php?id=100007
setxkbmap -option caps:escape &

# fix permissions for backlight file
# does not work with sudo
# reassign file to root after reboot
#sudo chown jneidel /sys/class/leds/smc::kbd_backlight/brightness
#sudo chown jneidel /sys/class/backlight/intel_backlight/brightness

# set higher keyboard repeat
xset r rate 185 100 &
# lock screen
# ~/scripts/i3/lock/autostart-lock
# bluelight filter
xflux -k 5000 -l 52 -g 13 &
# desktop monitor
~/scripts/conky/start-conky &
# disable external monitors
monitor off &
# disable annoying system beep
xset -b &
# hide cursor after 2 sec
unclutter --timeout 2 &
# X styles
xrdb .Xresources &

## daemons
mkfifo /tmp/xobpipe
tail -f /tmp/xobpipe | xob &
# hotkeys
sxhkd &
# notification
nice -n 5 dunst &
# pulseaudio and mpd
/bin/start-pulseaudio-x11 && mpd &

## gui application autostart
nice -n -7 kitty ~/scripts/tmux/t main vim &
nice -n 7 brave &
nice -n 7 signal-desktop &

# don't work if started directly
# {
#   sleep 10
#   # conky with local mpd cover
#   ~/scripts/mpd/local-cover &
#   # nitrogen --restore &
# } &

# wallpaper
xwallpaper --zoom ~/.config/wallpaper.png &

# status bar
nice -n -10 ~/scripts/lemonbar/run-lemonbar &

# fix backlight
sudo chown -R jneidel /sys/class/backlight/intel_backlight/brightness &

# disable systemd broadcast till v252 ships
sudo busctl set-property org.freedesktop.login1 /org/freedesktop/login1 org.freedesktop.login1.Manager EnableWallMessages b false

# start window manager
exec i3
