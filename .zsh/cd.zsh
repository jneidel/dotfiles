# cd aliases
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHDMINUS

setopt AUTO_CD
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias 2..='...'
alias 2...='....'
alias 3..='....'

mdc() { # MkDirCd
  mkdir "$1";
  cd "$1";
}
mvc() { # mv cd
  array=( $@ )
  len=${#array[@]}
  args=${array[@]:0:$len-1}
  last="${@: -1}"

  mv $(echo $args) "$last"

  if [ -d "$last" ]; then
    cd "$last"
  else
    base="$(dirname $last)"
    cd "$base"
  fi
}
