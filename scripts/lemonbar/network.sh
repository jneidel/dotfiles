#! /bin/bash
# This script gets fed a stream of patterns that matched an entry in the
# journalctl log of NetworkManager and mullvad-daemon.
# The patterns to match are found in 'network-patterns'.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# initial state
WIFI=$("$DIR/wifi-status")
VPN=0
HOMENET=0
echo "NET$WIFI $VPN $HOMENET"

while read -r line; do
  case "$line" in
    "New tunnel state: Connected"|"device (AirVPN-eu): Activation: successful, device activated.")
      VPN=1 ;;
    "New tunnel state: Disconnected"|"Error: Failed to set DNS"|"device (AirVPN-eu): state change: "*" -> disconnected")
      VPN=0 ;;
    "(w*): Activation: successful"|"NetworkManager state is now CONNECTED_GLOBAL"|"NetworkManager state is now CONNECTED_SITE")
      WIFI=1 ;;
    "(w*): state change: deactivating -> disconnected"|"NetworkManager state is now DISCONNECTED"|"dhcp4 (*): request timed out")
      WIFI=0 ;;
    "NetworkManager state is now CONNECTED_LOCAL"|"NetworkManager state is now CONNECTING")
      WIFI=2 ;; # connected local
    "device (rückersdorf_wg): state change: "*" -> disconnected"|"device (r__ckersdorf_wg): state change: "*" -> disconnected")
      HOMENET=0 ;;
    "device (rückersdorf_wg): Activation: successful, device activated."|"device (r__ckersdorf_wg): Activation: successful, device activated.")
      HOMENET=1 ;;
  esac
  echo "NET$WIFI $VPN $HOMENET"
done
