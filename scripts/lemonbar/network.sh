#! /bin/bash
# This script gets fed a stream of patterns that matched an entry in the
# journalctl log of NetworkManager and mullvad-daemon.
# The patterns to match are found in 'network-patterns'.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# initial state
WIFI=$("$DIR/wifi-status")
VPN=$("$DIR/vpn-status")
echo "NET$WIFI $VPN"

while read -r line; do
  case "$line" in
    "New tunnel state: Connected")
      VPN=1 ;;
    "New tunnel state: Disconnected"|"Error: Failed to set DNS")
      VPN=0 ;;
    "(w*): Activation: successful"|"NetworkManager state is now CONNECTED_GLOBAL"|"NetworkManager state is now CONNECTED_SITE")
      WIFI=1 ;;
    "(w*): state change: deactivating -> disconnected"|"NetworkManager state is now DISCONNECTED"|"dhcp4 (*): request timed out")
      WIFI=0 ;;
    "NetworkManager state is now CONNECTED_LOCAL"|"NetworkManager state is now CONNECTING")
      WIFI=2 ;; # connected local
  esac
  echo "NET$WIFI $VPN"
done

