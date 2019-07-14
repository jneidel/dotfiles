# rofi - dmenu replacement
## called from i3 config, via mod+d
## open windows, connect ssh, run applications

THEME_DIR=~/scripts/rofi

rofi -combi-modi window,ssh,run -show combi -lines 3 -eh 2 -width 60 -theme $THEME_DIR/rofi-arc-dark.rasi -font "yosemite-san-francisco 16"

