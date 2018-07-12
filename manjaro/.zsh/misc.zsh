# misc

alias v="vim"
alias src="source ~/.zshrc"
mdc() { # MkDirCd
  mkdir "$1";
  cd "$1";
}
calc() {
  echo "$1" | bc
}
alias calendar="cal -mn 6"
alias cal3="cal -3m"
alias cmx="chmod +x"
alias hdmi="xrandr --output HDMI1 --auto" # dublicate screen on connected hdmi
alias h="cd;clear;"
alias cpdir="cp -r"
alias dirsize="du -sh"
alias pkg="vim package.json"

