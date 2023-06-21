if [ "$(uname)" = "Darwin" ]; then
  alias brew="HOMEBREW_NO_INSTALL_CLEANUP=1 HOMEBREW_NO_AUTO_UPDATE=1 /usr/local/bin/brew"

  # php
  alias pt="./vendor/bin/phpunit"

  # oraclett
  local ORACLETT_MAIN_PROJECT=ORFDV001
  local ORACLETT_MAIN_TASK_DETAILS=03

  alias onl="oraclett note list"
  alias ona="oraclett note add -p $ORACLETT_MAIN_PROJECT -t $ORACLETT_MAIN_TASK_DETAILS"
  alias one="oraclett note edit"
  alias onr="oraclett note remove"

  alias onaprs="ona -n 'Review PRs'"
  alias onareviewprs="onaprs"
  alias onaceremonies="ona -n 'Sprint ceremonies'"

  alias ohl="oraclett hour list"
  alias oha="oraclett hour add -p $ORACLETT_MAIN_PROJECT -t $ORACLETT_MAIN_TASK_DETAILS"
  alias ohe="oraclett hour edit"
  alias ohr="oraclett hour remove"
  alias oha8="oha -H8"

  alias otl="oraclett ticket list -p $ORACLETT_MAIN_PROJECT"
  alias ota="oraclett ticket add -p $ORACLETT_MAIN_PROJECT"
  alias ote="oraclett ticket edit -p $ORACLETT_MAIN_PROJECT"
  alias otr="oraclett ticket remove -p $ORACLETT_MAIN_PROJECT"

  alias otc="oraclett timecard --classic"
fi
