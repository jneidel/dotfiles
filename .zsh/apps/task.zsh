# main report by default
export MAIN_TASK_REPORT=main
export MAIN_TASK_REPORT_OPTIONS="-francis limit:3"

alias tt="task $MAIN_TASK_REPORT"
alias te="task $MAIN_TASK_REPORT $MAIN_TASK_REPORT_OPTIONS" # t[ask]e[xtend]
t() {
  if [ -n "$1" ]; then
    if task-project check; then
      task-project "$@"
    else
      task "$@"
    fi
  else
    if task-project check; then
      task-project
    elif task +tackle >/dev/null 2>&1; then
      t $MAIN_TASK_REPORT +tackle
    else
      te
    fi
  fi
}

most_urgent_task() {
  t $MAIN_TASK_REPORT $MAIN_TASK_REPORT_OPTIONS limit:1 rc.verbose=nothing rc.gc=off | grep -Po "^\s*\K\d+"
}

# crud
alias tm="task mod"
alias  m="task mod"
alias trm="task rm"
alias to="taskopen"
ti() {
  if [ -n "$1" ]; then
    id="$1"
    task info "$id"
    printf "Modify? "
    read ans
    if [ -n "$ans" ]; then
      task mod $id $ans
    fi
  else
    task info $(most_urgent_task)
  fi
}

# manage active task
alias ts="task start"
tsu() {
  task start $(most_urgent_task)
}
alias td="task done"
alias  d="task done"
tdu() {
  task done $(most_urgent_task) && t
}

# manage latest task
latest_task() {
  task +LATEST ids
}
tml() {
  tm $(latest_task)
}
alias ml="tml"

# reports
alias tn="task next"
alias tl="task list"
alias ta="task all '(status:waiting or status:pending)'"
alias tre="task ready"

# other
alias tui="taskwarrior-tui -r $MAIN_TASK_REPORT"
alias tc="task context"
alias tackle="tm +tackle"
