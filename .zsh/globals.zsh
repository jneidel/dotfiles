# globals (can be accessed everywhere in a command)
## usage example: $ cat readme.md G match L

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
alias -g G="| grep"
alias -g GP="| grep -P"
if [ -e ~/scripts/hhighlighter.sh ]; then
  source ~/scripts/hhighlighter.sh;
  alias -g HL="| hhighlighter -i" # highlight the given words
fi

## format text
alias -g PP="| pjson" # pretty print json

## redirect output
alias -g N1=">/dev/null"      # no stdout
alias -g N2="2>/dev/null"     # no stderr
alias -g NO=">/dev/null 2>&1" # neither

for i in $(seq 0 10); do
  alias -g H$i="HEAD~$i"
done

## misc
alias -g PB="| nc termbin.com 9999" # terminal pastebin
alias -g C="| wc -l | human-number" # get line number count
alias -g LCP="| history | tail -n1 | cut -d\  -f2- | sed -e 's/^[[:space:]]*//' | xclip -f -sel clip" # copy last command to clip
alias -g R="| entr -c" # R[UN]; rerun cmd on file changes; example: ls *.ts R tsc
alias W="watch -t -d -n 1"

# copy to clipboard
if [ "$(uname)" = "Darwin" ]; then
  alias -g CP="| pbcopy"
else
  alias -g CP="| xclip -f -sel clip"
fi
