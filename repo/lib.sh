#! /bin/sh
# shared environment and functions

MAPPINGS="$DIR/mappings"
APP_LIST="$DIR/package-groups"
IN_USE="$DIR/used-groups"
IN_USE_TMP=/tmp/used-apps
sed -r "s/^(.*)$/^\1$/" $IN_USE >$IN_USE_TMP

export XDG_STATE_HOME="${XDG_DATA_HOME:-$HOME/.local/state}"

[ ! -z $DRY ] && echo DRYRUN

BASE=$DIR/..
[ -z "$DISABLE_LOGGING" ] && DISABLE_LOGGING=0

function copy-dir {
  # TODO: support for root dirs
  [ -z $DRY ] && mkdir -p $2
  [ -z $DRY ] && cp -r $1/* $2

  if [ "$DISABLE_LOGGING" -eq 0 ]; then
    if echo $1 | grep "/repo/" >/dev/null; then
      echo "copy dir:    $(echo $1 | tr / '\n' | grep -A10 -F repo | tail -n +3 | tr '\n' /)"
    else
      echo "copy dir:    $1"
    fi
  fi
}

function copy-file {
  if shouldWorkOnRootFile "$2"; then
    [ -z $DRY ] && sudo cp $1 $2
  else
    [ -z $DRY ] && cp $1 $2
  fi

  if [ "$DISABLE_LOGGING" -eq 0 ]; then
    if shouldWorkOnRootFile "$1"; then
      echo "copy file:   $1"
    elif shouldWorkOnRootFile "$2"; then
      echo "copy file:   $2"
    else

      if echo $1 | grep "/repo/" >/dev/null; then
        echo "copy file:   $(echo $1 | tr / '\n' | grep -A10 -F repo | tail -n +3 | tr '\n' /)"
      else
        echo "copy file:   $(echo $1 | cut -d "/" -f 4-)"
      fi
    fi
  fi
}

function create-dir {
  if shouldWorkOnRootFile "$1"; then
    [ -z $DRY ] && sudo mkdir -p "$1"
  else
    [ -z $DRY ] && mkdir -p "$1"
  fi

  if [ "$DISABLE_LOGGING" -eq 0 ]; then
    if echo $1 | grep "/repo/" >/dev/null; then
      echo "create dir:  $(echo $1 | tr / '\n' | grep -A10 -F repo | tail -n +3 | tr '\n' /)"
    else
      echo "create dir:  $1"
    fi
  fi
}

function clean-copy-dir {
  [ -z $DRY ] && rm -r $2
  copy-dir "$1" "$2"
}

function isRootFile {
  test "$(echo $1 | cut -c1)" = '/'
}
function shouldWorkOnRootFile {
  test "$(echo $1 | cut -d/ -f1-3)" != "$HOME"
}

function run-command {
  CMD=$(echo "$1" | cut -d\  -f2)
  [ "$DISABLE_LOGGING" -eq 0 ] && echo "run cmd:      $CMD"
  [ -e "$CMD" ] && sh $CMD || echo file does not exist
}
