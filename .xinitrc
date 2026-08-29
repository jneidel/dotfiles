#!/bin/sh
# run manually with 'startx'
# run automatically after logging into tty1 through ~/.zshrc

## X settings
# capslock mod-tap: tap = esc, hold = control
# ö mod-tap: tap = ö, hold = hyper
# setxkbmap -option caps:escape &
sudo kmonad ~/.config/kmonad/mod-tap-mappings.kbd &
(sleep 3s; sudo xremap ~/.config/xremap.yml &) &
{
  sleep 7s; xmodmap /home/jneidel/.config/Xmodmap-remove-Hyper_R; xmodmap ~/.config/Xmodmap
  sleep 17s; xmodmap /home/jneidel/.config/Xmodmap-remove-Hyper_R; xmodmap ~/.config/Xmodmap
} &

# set higher keyboard repeat after kmonad/xmodmap
(sleep 9s && xset r rate 185 100) &
(sleep 19s && xset r rate 185 100) &

# disable annoying system beep
xset -b &

# X styles
xrdb -load "$XDG_CONFIG_HOME/X11/Xresources" &

# wallpaper
xwallpaper --zoom ~/.config/wallpaper.png &

# hide cursor after 2 sec
unclutter --timeout 2 &

# disable external monitors
monitor off &

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

# play jellyfin videos via mpv
(sleep 1m; nice -n 10 jellyfin-mpv-shim &) &

# desktop monitor
# ~/scripts/conky/start-conky &

# CPU frequency scaling governor
(sleep 1m; sudo cpupower frequency-set --governor conservative) &
## systemd service fails on boot, but works once in userspace
# fix cpu frequency
# (echo passive | sudo tee /sys/devices/system/cpu/intel_pstate/status ; sudo cpupower frequency-set -g userspace) &

# lock the screen on suspend/hibernate
# xss-lock --transfer-sleep-lock ~/scripts/i3/lock/lock &
# lock screen after 5h of inactivity
# xset dpms 0 0 18000
# https://wiki.archlinux.org/title/Session_lock
# https://unix.stackexchange.com/a/639552

# status bar
(sleep 10s; nice -n -5 ~/scripts/lemonbar/run-lemonbar &) &

# fix backlight permissions
sudo chown -R jneidel /sys/class/backlight/intel_backlight/brightness &

# fetch new mail to local when it arrives on imap server
(sleep 1m; ~/scripts/mail/watch-imap >/dev/null 2>&1 &) &

## autostart gui applications
nice -n -7 emacs &
nice -n -7 kitty ~/scripts/tmux/tp main &
nice -n 12 keepassxc &
nice -n 17 firefox &
nice -n 17 signal-desktop &
nice -n 19 watch-for-deadline-changes &
nice -n 19 /usr/lib/xdg-desktop-portal-gtk >/dev/null 2>&1 &
# service keeps failing: systemctl --user status xdg-desktop-portal-gtk

# start window manager
exec i3
