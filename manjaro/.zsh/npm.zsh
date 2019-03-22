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
alias nr="npm run"
alias nt="npm run test"
alias ns="npm run start"
alias start="npm run start"
alias nrl="npm run lint"

### build
alias nb="npm run build"
alias nbt="npm run build-ts"
alias nbw="npm run build-webpack"
alias build="npm run build"

### watch
alias nw="npm run watch"
alias nwt="npm run watch-test"
alias nwts="npm run watch-ts"
alias nww="npm run watch-webpack"
alias nwu="npm run watch-unit"
alias ntw="npm run watch-test"

## misc
alias npmls="npm list -g --depth=0" # list npm -g pkgs

