#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# initial state
WIFI=$("$DIR/wifi-status")
VPN=$("$DIR/vpn-status")
echo "NET$WIFI $VPN"

while read -r line; do
  case "$line" in
    "New tunnel state: Connected")
      VPN=1 ;;
    "New tunnel state: Disconnected")
      VPN=0 ;;
    "wlp3s0): Activation: successful")
      WIFI=1 ;;
    "wlp3s0): state change: deactivating -> disconnected")
      WIFI=0 ;;
  esac
  echo "NET$WIFI $VPN"
done

