if [ "$(uname)" = "Linux" ]; then
  alias dockerr="sudo docker"
else
  alias dockerr="docker"
fi

# use images
alias db="dockerr build"
alias dr="dockerr run --rm"
alias dri="dockerr run -it"

# list
alias di="dockerr images | grep -Fv 'rancher/'"
alias dps="dockerr ps -a | grep -Fve 'rancher/' -e 'k8s_'"

# rm
alias rmc="dockerr rm"
alias rmca='dockerr rm $(dockerr ps -q -a) >/dev/null 2>&1; true'
alias rmi="rmca; dockerr rmi"
function rmia() {
  rmca
  dockerr images | grep -F '<none>' | awk '{ print $3 }' | tr '\n' ' ' | xargs dockerr rmi -f
}
alias rma="rmia" # rm all
alias dk="dockerr kill"
dex() {
  dockerr exec -it $1 bash
  # -u 0 for root access
}
dep() {
  local CONTAINER_ID=$1; shift
  dockerr exec -it $CONTAINER_ID psql $@
}

# docker-compose
function dc() {
  dockerr compose --ansi always $@ | grep -v rabbitmq-1
}
alias dcb="dockerr compose build"
alias dcup="dockerr compose up"
alias dcdown="dockerr compose down"
alias dcre="dockerr compose restart"
alias dcs="yq '.services | keys' docker-compose.yml"

alias k="kubectl"
# get
alias kp="k get pods"
alias pods="k get pods"
alias kpw="k get pods -o wide"
alias kd="k get deployments"
alias depl="k get deployments"
alias ks="k get services"
alias serv="k get services"
alias kall="k get all"
alias kn="k get namespace | grep -Fve kube-public -e kube-system -e kube-node-lease"
alias kcm="k get configmap"
alias ki="k get ingresses"
alias kpv="k get pv"
alias kpvc="k get pvc"

# debugging
alias kl="k logs"
alias kdes="k describe"
kx() {
  k exec -it $1 -- bin/bash
}

# apply config
alias ka="k apply -f"
alias kr="k delete -f"
alias krm="k delete -f"
