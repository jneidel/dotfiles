# cmus

# remote control
alias cm="~/scripts/cmus/play-pause.sh"
alias cmn="~/scripts/cmus/next.sh"
alias cmp="~/scripts/cmus/previous.sh"
alias cmm="cmus-remote -C 'toggle aaa_mode'; cmus-print-mode" # Changa aaa mode
alias cma="cmus-remote -C 'set aaa_mode=all'; cmus-print-mode" # Set aaa to all
function cmus-print-mode() {
  printf "AAA: "
  cmus-remote -C "set aaa_mode" | cut -d "'" -f 2 | cut -d "=" -f 2
}

