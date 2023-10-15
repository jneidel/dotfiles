export DOTREMINDERS=$ORG_CALENDAR/main

mc() {
  n=2
  if [ -n "$1" ]; then
    n=$1
  fi
  clear && rem -b1 -cu+$n -m -@2,0 2>/dev/null
}
alias mcm="clear && rem -b1 -cu+4 -m -@2,0 2>/dev/null"
alias mcmm="clear && rem -b1 -cu+6 -m -@2,0 2>/dev/null"

for i in {1..16}; do
  alias mc$i="clear && rem -b1 -cu+$i -m -@2,0 2>/dev/null"
done
alias mce='rem -b1 -cu+2 -m -@2,0 2>&1 | grep -ve "│" -e "trigger" -e "┬" -e "┼" -e "┴"'

events() {
  export DOTREMINDERS=$ORG_CALENDAR/events
}
