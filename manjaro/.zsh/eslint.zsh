# eslint

## fix js
alias fix="eslint --fix"
alias fixa="eslint . --fix"

alias fixt="eslint --config ~/.eslintrc.ts --fix"
alias fixta="eslint --config ~/.eslintrc.ts . --fix"

## create markdown toc
alias toc="markdown-toc -i readme.md"
alias lint="fixa; toc;"

