alias l="hledger -s"

# reports
alias -g NOFLOW="--color=always | grep -ve income -e opening -e ex: -e XMR -e bal | head -n-2" # no money flow
alias pots="l bal NOFLOW"
alias ass="l bal -R NOFLOW"

alias tj="LEDGER_FILE='$ORG_AREAS/Investieren/trade.journal' hledger -X $"
alias -g NOEQ="--color=always | head -n-3 | grep -ve equity"
alias tjb="tj bal NOEQ"
