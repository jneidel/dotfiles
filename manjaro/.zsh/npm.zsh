# npm

## install
alias ni="npm install"
alias nid="npm install --save-dev"
alias nig="sudo npm install -g"
function nit {
  npm install --save-dev "@types/$1";
}
function nitt {
  PKG=$1

  if [ -z $PKG ]; then {
    echo "Install npm packages as well as its types locally."
    echo "$ nit <package-name>"
    echo "Please include a package to install."
    exit
  } fi

  npm install $PKG;
  npm install --save-dev "@types/$PKG";
}

## uninstall
alias nu="npm uninstall"
alias nug="sudo npm uninstall -g"

## run
alias nr="npm run"
alias start="npm run start"
alias build="npm run build"
alias nt="npm run test"
alias testing="npm run testing"
alias unit="npm run unit"

## misc
alias npmls="npm list -g --depth=0" # list installed npm clis
alias npmdir="cd ~/.bin/node-latest/bin"

