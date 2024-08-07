# shortcuts

alias src="source ~/.zshrc"
alias mmv="qmv -f do -d" # massmove
alias auto="xrandr --auto" # dublicate screen on connected hdmi

## recursive shortcuts
alias rmr="rm -rf"
cpr() {
  if [ "$(uname)" = "Darwin" ]; then
    cp -rv $@
  else
    cp -rvan $@
  fi
}

## permissions
alias cmx="chmod +x" # add executable
alias cmd="chmod 755" # default dir
alias cmf="chmod 644" # default file
alias own="sudo chown $USER" # change owner

## dir/disk info
alias ds="du -sh" # d[ir]s[ize] in GiB (gibibytes)
alias dirsize="ds"
alias disksize="df -h"

## calendar
alias calendar="cal -mn 6"
alias cal3="cal -3"

## background
alias b="background"
alias back="bg 2>/dev/null; disown"

