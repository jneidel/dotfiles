# ls

function filterls() {
  # filter out unwanted files/dirs
  # from ls -1aF output
  awk '{ if ( \
    $1 != "./" && \
    $1 != "../" && \
    $1 != ".git/" \
  ) print };'
}
function colorls() {
  # manually color like -G would,
  # based on -F appending */@
  #
  # 0m   = white  - default
  # 1;34 = blue   - directories
  # 0;35 = purple - symlinks
  # 0;31 = red    - executables
  # color list: http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
  awk '{
    printf "\033[0m";
    if ( /\/$/ ) printf "\033[1;34m"; \
    else if ( /@$/ ) printf "\033[0;35m"; \
    else if ( /(mp4)|(mkv)|(m4v)|(pdf)|(png)|(jpeg)|(jpg)|(mp3)\*$/ ) printf "\033[0m"; \
    else if ( /\*$/ ) printf "\033[0;31m";
    print;
  };'
}

alias ls="exa --git-ignore"
alias l="exa -1a" # "ls -1aF | filterls | colorls" # all files
alias la="exa -1 --git-ignore" # "ls -1FG"    # no . files
alias ld="exa -1D" # "ls -1Gd */" # only dirs
alias li="exa -lah --git" #"ls -lahoFG" # show permissions

export EXA_COLORS="di=1;34" # make dirs bold again

