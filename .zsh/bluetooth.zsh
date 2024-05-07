# my bluetooth devices, not useful for anybody else
alias cr="btconnect B8:D5:0B:AD:AA:26" # red JBL Charge 3
alias c3="cr"
alias ct="btconnect FC:A8:9A:E0:3E:1E" # turquoise Charge
alias cb="btconnect 98:52:3D:A7:45:A9" # black Charge, in DD
alias m4="btconnect 14:3F:A6:67:91:D1" # Sony WH-1000XM4
alias oo="btconnect 28:FA:19:84:BB:20" # Oladance overear
alias g3="btconnect F4:2B:7D:11:3E:FB" # green soundcore motion 300, hanging speaker
alias m3="g3"
alias hang="g3"

### connecting multiple speakers with each other requires a constant audio stream like such:
# # stream random audio file over bluetooth to stop charge from stuttering when using it in connect mode
# kill $(pgrep -f "$HOME/scripts/personal/audio.mp3") 2>/dev/null
# /bin/mpv -ao pulse ~/scripts/personal/audio.mp3 --mute --loop-file=inf >/dev/null 2>&1 &
