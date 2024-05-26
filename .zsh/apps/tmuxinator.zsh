_complete_tp() {
  local files=($(tp print_completions))
  compadd -a files
}
compdef _complete_tp tp
