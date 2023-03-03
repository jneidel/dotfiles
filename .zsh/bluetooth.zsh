# my bluetooth devices, not useful for anybody else
alias c3="btconnect B8:D5:0B:AD:AA:26" # red JBL Charge 3
alias ct="btconnect FC:A8:9A:E0:3E:1E" # turquoise Charge
alias cb="btconnect 98:52:3D:A7:45:A9" # 1st black Charge, in DD
alias b2="btconnect F8:DF:15:A9:B7:D7" # 2nd black Charge, in OSW
alias m4="btconnect 14:3F:A6:67:91:D1" # Sony WH-1000XM4
alias oo="btconnect 28:FA:19:84:BB:20" # Oladance overear

### connecting multiple speakers with each other requires a constant audio stream like such:
# # stream random audio file over bluetooth to stop charge from stuttering when using it in connect mode
# kill $(pgrep -f "$HOME/scripts/personal/audio.mp3") 2>/dev/null
# /bin/mpv -ao pulse ~/scripts/personal/audio.mp3 --mute --loop-file=inf >/dev/null 2>&1 &
