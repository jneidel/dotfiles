# github cli client

hi() {
  cmd="$2"
  issue_num="$1"
  if [ -n "$cmd" ]; then
    case "$cmd" in
      o|open) hub issue show $issue_num -f "%U" | xargs $BROWSER >/dev/null 2>&1;;
      e|edit) hub issue update --edit $issue_num
    esac
  elif [ -n "$issue_num" ]; then
    hub issue show -f "%sC%i%Creset %t% l %Nc%n%b%n" $issue_num
  else
    hub issue
  fi
}
alias hic="hub issue create" # add labels with -l
