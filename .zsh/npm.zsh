# npm

## install
alias ni="npm install"
alias nid="npm install --save-dev"
alias nig="sudo npm install -g -s" # remove sudo if locally installed
function nit {
  npm install --save-dev "@types/$1";
}
function nitt { # pkg + types
  npm install "$1";
  npm install --save-dev "@types/$1";
}

## uninstall
alias nu="npm uninstall"
alias nug="sudo npm uninstall -g"

## run
alias nr="npm run --silent"
alias nt="nr test"
alias ns="nr start"
alias start="nr start"
alias nrl="nr lint"
alias nlk="nr link"

### build
alias nb="nr build"
alias nbt="nr build-ts"
alias nbw="nr build-webpack"
alias build="nr build"

### watch
alias nw="nr watch"
alias nwt="nr watch-test"
alias nwts="nr watch-ts"
alias nww="nr watch-webpack"
alias nwu="nr watch-unit"
alias ntw="nr watch-test"

## misc
alias npmls="npm list -g --depth=0" # list npm -g pkgs
alias npml="sudo npm link"

