# use images
alias db="docker build"
alias dr="docker run --rm"
alias dri="docker run -it"

# list
alias di="docker images | grep -Fv 'rancher/'"
alias dps="docker ps -a | grep -Fve 'rancher/' -e 'k8s_'"

# rm
alias rmc="docker rm"
alias rmca='docker rm $(docker ps -q -a) >/dev/null 2>&1; true'
alias rmi="rmca; docker rmi"
function rmia() {
  rmca
  docker images | grep -F '<none>' | awk '{ print $3 }' | tr '\n' ' ' | xargs docker rmi -f
}
alias rma="rmia" # rm all
alias dk="docker kill"
dex() {
  docker exec -it $1 bash
  # -u 0 for root access
}
dep() {
  local CONTAINER_ID=$1; shift
  docker exec -it $CONTAINER_ID psql $@
}

# docker-compose
function dc() {
  docker compose --ansi always $@ | grep -v rabbitmq-1
}
alias dcb="docker compose build"
alias dcup="docker compose up"
alias dcdown="docker compose down"
alias dcre="docker compose restart"
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
