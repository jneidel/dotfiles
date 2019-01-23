# Change volume
# usage: set-vol +5

pulsemixer --change-volume $1;

cur=$(pulsemixer --get-volume | cut -d ' ' -f 2)
icon=audio-volume-medium
#if [ $cur = "0" ]; then
  #icon="audio-volume-muted"
#else
  #if [ $cur -lt "33" ]; then
    #icon="audio-volume-low"
  #else
    #if [ $cur -lt "67" ]; then
      #icon="audio-volume-medium"
    #else
      #icon="audio-volume-high"
    #fi
  #fi
#fi

notify-send "volume: " -h int:value:$cur -h string:synchronous:volume -i $icon -t 800

