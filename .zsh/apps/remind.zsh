export DOTREMINDERS=$ORG_RESOURCES/calendar/main

alias mc="clear && rem -b1 -cu+2 -m -@2,0 2>/dev/null"
alias mcm="clear && rem -b1 -cu+4 -m -@2,0 2>/dev/null"
alias mcmm="clear && rem -b1 -cu+6 -m -@2,0 2>/dev/null"
alias mc4=mcm
alias mc6=mcmm
alias mc8="clear && rem -b1 -cu+8 -m -@2,0 2>/dev/null"
alias mc12="clear && rem -b1 -cu+12 -m -@2,0 2>/dev/null"
alias mc14="clear && rem -b1 -cu+14 -m -@2,0 2>/dev/null"
alias mc16="clear && rem -b1 -cu+16 -m -@2,0 2>/dev/null"
alias mce='rem -b1 -cu+2 -m -@2,0 2>&1 | grep -ve "│" -e "trigger" -e "┬" -e "┼" -e "┴"'
alias to="rem 2>/dev/null | grep -v Reminders"

events() {
  export DOTREMINDERS=$ORG_RESOURCES/calendar/events
}
