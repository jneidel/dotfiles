if [ "$(uname)" = "Darwin" ]; then
  alias jl="jira issue list -q'status not in (Rejected, Tested, Approved, \"Ready To Test\") AND Owner in (JNeidel)'"
  # usage:
  # v to view
  # m to change state (move)

  jira(){
    if [ -n "$1" ]; then
      fjira "ORFDV001-$1"
    else
      fjira -p ORFDV001
    fi
  }
else
  alias jira="fjira -p JD"
fi
