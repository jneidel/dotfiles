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
    else if ( /(mp4)|(mkv)\*$/ ) printf "\033[0m"; \
    else if ( /\*$/ ) printf "\033[0;31m";
    print;
  };'
}

alias l="ls -1aF | filterls | colorls" # all files
alias lo="ls -1aF"    # all files, without filter
alias la="ls -1FG"    # no . files
alias ld="ls -1Gd */" # only dirs
alias li="ls -lahoFG" # show permissions

