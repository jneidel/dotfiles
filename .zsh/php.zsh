function ci() { # composer install
  if [ $# = 0 ]; then
    composer install
  else
    composer require $@
  fi
}
alias cul="symfony composer validate --strict || symfony composer update --lock"

alias sy="symfony"
function sytop() {
  local toplevel_dir="$(git rev-parse --show-toplevel 2>/dev/null)"
  if [ -z "$toplevel_dir" ]; then
    sy $@
  else
    current="$(pwd)"
    cd "$toplevel_dir"
    sy $@
    cd "$current"
  fi
}
alias sc="sytop console"
function de() { # debug
  sc debug:$@
}
cs() {
  symfony composer install --no-interaction --no-progress
  symfony php vendor/bin/phpcbf -p
  symfony php vendor/bin/rector process
}
alias stan="sytop php vendor/bin/phpstan"
alias svar="sy var:export --multiline"
st() {
  if [ -z "$@" ]; then
    local staged_files=$(git status --porcelain | grep tests | awk '/^\s?[MA]..*php$/ { print $2 }' | xargs)
    if [ -z "$staged_files" ]; then
      echo "No test files staged"
      s
      return 1
    fi
    sytop php vendor/bin/phpunit $(echo $staged_files)
  else
    sytop php vendor/bin/phpunit $@ # --group=temp
  fi
}
sref() { # refactor
  local toplevel_dir="$(git rev-parse --show-toplevel 2>/dev/null)"
  if [ -z "$toplevel_dir" ]; then
    echo "Not a git repo"
    return 1
  fi
  current="$(pwd)"
  cd "$toplevel_dir"

  local staged_files=$(git status --porcelain | awk '/^\s?[MA]..*php$/ { print $2 }' | xargs)
  if [ -z "$staged_files" ]; then
    echo "No php files staged"
    cd "$current"
    s
    return 1
  fi
  echo "Refactoring:"
  echo $staged_files | tr " " "\n"

  [ -e "vendor/bin/phpcbf" ] && sy php vendor/bin/phpcbf $(echo $staged_files)
  [ -e "vendor/bin/rector" ] && sy php vendor/bin/rector process $staged_files

  cd "$current"
}

# debug:autowiring [KEYWORD] - find available services
# debug:container [KEYWORD] - more info on a container (service that might not be available via autowiring)
# debug:container --parameters - list all parameters (and their values)
# about:twig - list twig filters/functions
# about - show versions
# sy var:export --multiline - show used env vars
#
# config:dump - for list of bundles (or config/bundle.php)
# config:dump [BUNDLE] [SECTION] - show default configuration for a bundle
# debug:config [BUNDLE] [SECTION] - show current used configuration for a bundle
#
# secrets:set VARIABLE_NAME --env=APP_ENV - add a secret to the vault
# secrets:list - show secrets
#
# make:entity

alias sdm="sc make:migration --no-interaction"
alias mig="make vendor && sc doctrine:migrations:migrate --no-interaction"
function migrate() {
  sdm sdmm
}
function recreate() {
  rm migrations/*.php 2>/dev/null
  symfony console doc:database:drop --force
  symfony console doc:database:create --no-interaction
  symfony console make:migration --no-interaction
  symfony console doc:migrations:migrate --no-interaction
  symfony console doc:fixtures:load --no-interaction
}

alias sq="sc dbal:run-sql"
function sqr() {
  sc dbal:run-sql "$1" | grep -vFe "---" | tail -n +2 | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' -e '/^$/d'
}
function fixtures() {
  sc doc:fixtures:load --no-interaction
}

alias gitlab="gitlab-runner exec docker"

function pulldev() {
  co develop
  git pull origin develop
  make vendor && sc doctrine:migrations:migrate --no-interaction
}
