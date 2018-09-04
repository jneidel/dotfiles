pulsemixer --toggle-mute

cur=$(pulsemixer --get-volume | cut -d ' ' -f 2)
icon=audio-volume-muted

notify-send "mute: " -h int:value:$cur -h string:synchronous:volume -i $icon -t 800

