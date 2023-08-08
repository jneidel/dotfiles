export DOTREMINDERS=$ORG_RESOURCES/calendar/main

alias mc="clear && rem -b1 -c+u2 -m -@2,0 2>/dev/null"
alias mcm="clear && rem -b1 -c+u4 -m -@2,0 2>/dev/null"
alias mcmm="clear && rem -b1 -c+u6 -m -@2,0 2>/dev/null"
alias mc4=mcm
alias mc6=mcmm
alias mc8="clear && rem -b1 -c+u8 -m -@2,0 2>/dev/null"
alias mc12="clear && rem -b1 -c+u12 -m -@2,0 2>/dev/null"
alias mc14="clear && rem -b1 -c+u14 -m -@2,0 2>/dev/null"
alias mc16="clear && rem -b1 -c+u16 -m -@2,0 2>/dev/null"
alias mce='rem -b1 -c+u2 -m -@2,0 2>&1 | grep -ve "│" -e "trigger" -e "┬" -e "┼" -e "┴"'
alias to="rem 2>/dev/null | grep -v Reminders"

events() {
  export DOTREMINDERS=$ORG_RESOURCES/calendar/events
}
