alias history="builtin fc -l 1"

export HISTFILE="$XDG_STATE_HOME"/zsh/history
export HISTSIZE=50000
export SAVEHIST=10000

setopt HIST_IGNORE_DUPS   # ignore duplicated commands history list
setopt HIST_IGNORE_SPACE  # ignore commands that start with space
setopt HIST_VERIFY        # show command with history expansion to user before running it
setopt INC_APPEND_HISTORY # add commands to HISTFILE in order of execution
