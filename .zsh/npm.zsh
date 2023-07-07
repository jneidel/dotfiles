# npm

## install
alias _npm="disable-mullvad-for npm"
alias _sudonpm="disable-mullvad-for sudo npm"

alias ni="_npm install"
alias nid="ni --save-dev"
alias nig="_sudonpm install -g -s" # remove sudo if locally installed
function nit {
  nid "@types/$1";
}
function nitt { # pkg + types
  ni "$1";
  nit "$1";
}

## uninstall
alias nu="npm uninstall"
alias nug="sudo npm uninstall -g"

## run
alias nr="npm run --silent"
alias nt="nr test"
alias ns="nr start"
alias start="nr start"
alias nl="nr lint"
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
alias nwb="nr watch-build"
alias nwts="nr watch-ts"
alias nww="nr watch-webpack"
alias nwu="nr watch-unit"
alias ntw="nr watch-test"
alias nws="nr watch-start"

## volta
alias vr="volta run npm run --silent"
alias vt="vr test"
alias vs="vr start"
alias vl="vr lint"
alias vb="vr build"
alias vw="vr watch"

## misc
alias npmls="npm list -g --depth=0" # list npm -g pkgs
alias npml="sudo npm link"

## package.json
alias pkg="cat package.json"
alias pkge="vim package.json"
alias pkgs="jq .scripts <package.json"
