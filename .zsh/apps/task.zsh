t() {
  if [ -n "$1" ]; then
    task "$@"
  else
    task ready
  fi
}

# reports
alias tn="task next"
alias tl="task list"
alias ta="task all '(status:waiting or status:pending)'"
alias tre="task ready"

# crud
alias td="task done"
alias ts="task start"

# org
alias ti="task add tag:inbox"
