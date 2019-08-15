# globals (can be accessed everywhere in a command)
## usage: $ cat readme.md G match L

expand-global-aliases() {
  # see: https://www.youtube.com/watch?v=WTTIGjZAMGg
  # see: https://github.com/gotbletu/shownotes/blob/master/zsh_global_alias_expansion.md
  if [[ $LBUFFER =~ '[A-Z0-9]+$' ]]; then
    zle _expand_alias
    zle expand-word
  fi
  zle self-insert
}
zle -N expand-global-aliases
bindkey " " expand-global-aliases

## readers
alias -g L="| less"         # open in reader
alias -g H="| head"         # print first 10 lines
alias -g T="| tail"         # print last 10 lines
alias -g HP="--help | less" # show help in reader
alias -g LL="2>&1 | less"   # shallow errors and open in reader

## filter text
alias -g G="| grep --color=auto"
alias -g GP="| grep -P"
if [ -e ~/scripts/hhighlighter.sh ]; then
  source ~/scripts/hhighlighter.sh;
  alias -g HL="| hhighlighter -i" # highlight the given words
fi

## format text
alias -g PP="| pjson" # pretty print json

## redirect stdout/stderr
alias -g N1="2> /dev/null"     # only stdout, prev NE
alias -g N2="> /dev/null 2>&1" # only stderr, prev NUL

## misc
alias -g PB="| nc termbin.com 9999" # terminal pastebin
alias -g C="| wc -l | human-number" # get line number count
alias -g CP="| xclip -f -sel clip" # copy to clipboard


