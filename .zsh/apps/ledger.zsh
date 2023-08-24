alias l="hledger -s"

# reports
alias -g NOFLOW="--color=always | grep -ve income -e opening -e expenses -e XMR | head -n-2" # no money flow
alias pots="l bal NOFLOW"
alias ass="l bal -R NOFLOW"
