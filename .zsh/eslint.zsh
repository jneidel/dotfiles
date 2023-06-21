# eslint

## fix js
alias fix="eslint --fix"
alias fixa="eslint . --fix"

# alias fixt="eslint --ext '.ts' --config ~/.config/eslint/eslintrc-ts --parser-options \"{'tsconfigRootDir':\"$(git rev-parse --show-toplevel)\"}\" --fix"
gitRoot() {
}
tfix() {
  local gitRoot="$(git rev-parse --show-toplevel)"
  eslint --ext '.ts' --config ~/.config/eslint/eslintrc-ts --parser-options "{'tsconfigRootDir':\"$gitRoot\"}" "$gitRoot" --resolve-plugins-relative-to=/usr/lib/node_modules --fix
}

## create markdown toc
alias toc="markdown-toc -i readme.md"
alias lint="fixa; toc;"
