#!/bin/bash

# load config
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. "$DIR/config"

# parse fifo
while read -r line ; do
  case $line in
    SYS*) # conky
      sys_arr=(${line#???})
      # date
      datetime="${sys_arr[0]} ${sys_arr[1]} ${sys_arr[2]} ${sys_arr[3]}" # dotw, date, month, time
      datetime="%{B${col_sec}}${sep_left} %{T2}${datetime}%{T-} ${sep_right}"
      # cpu
      cpu="${sys_arr[4]} ${sys_arr[5]}" # cpu, load
      cpu="%{B${col_main}}${sep_left}  %{T2}${cpu}%{T-} ${sep_right}"
      # diskspace
      diskspace="${sys_arr[6]}"
      diskspace="%{B${col_main}}${sep_left}  %{T2}${diskspace}%{T-} ${sep_right}"

      if [ "${sys_arr[7]}" = "G" ]; then # mysterious G dirupts the order
        # battery
        battery="${sys_arr[8]} %{T2}${sys_arr[9]}%%{T-}" # icon, percentage
        battery="%{B${col_main}}${sep_left} ${battery} ${sep_right}"
        # network monitor
        downspeed="${sys_arr[10]}${sys_arr[11]}" # speed, unit
        downspeed="%{B${col_main}}${sep_left} ﲐ %{T2}${downspeed}%{T-} ${sep_right}"
      else
        # battery
        battery="${sys_arr[7]} %{T2}${sys_arr[8]}%%{T-}" # icon, percentage
        battery="%{B${col_main}}${sep_left} ${battery} ${sep_right}"
        # todo: change foreground to red if battery < 5%, same for load/cpu
        # network monitor
        downspeed="${sys_arr[9]}${sys_arr[10]}" # speed, unit
        downspeed="%{B${col_main}}${sep_left} ﲐ %{T2}${downspeed}%{T-} ${sep_right}"
      fi
      ;;
    NET*) # wifi/vpn
      network=""
      net_arr=(${line#???})
      if [ "${net_arr[0]}" -eq 1 ]; then
        if [ "${net_arr[1]}" -eq 1 ]; then
          network="%{B${col_sec}}${sep_left} 直 %{T2}on%{T-} ${sep_right}"
        else
          network="%{B${col_active}}${sep_left} 直 %{T2}no vpn%{T-} ${sep_right}"
        fi
      else
        if [ "${net_arr[0]}" -eq 2 ]; then
          network="%{B${col_main}}${sep_left} 直 %{T2}local wifi%{T-} ${sep_right}"
        else
          network="%{B${col_main}}${sep_left} 直 %{T2}no wifi%{T-} ${sep_right}"
        fi
      fi
      network="$network%{B$col_sec}"
      ;;
    WSP*) # i3 workspaces
      wsp="" # reset previous content
      set -- ${line#???}
      while [ $# -gt 0 ]; do
        case $1 in
         FOC*)
           wsp="${wsp}%{B${col_active}}${sep_left_rev} %{T2}$(echo ${1#???} | cut -d: -f2)%{T-} ${sep_right_rev}"
           ;;
         INA*|URG*|ACT*)
           wsp="${wsp}%{B${col_main}}${sep_left_rev} %{T2}$(echo ${1#???} | cut -d: -f2)%{T-} ${sep_right_rev}"
           ;;
        esac
        shift
      done
      ;;
  esac

  # bar ends
  end_right="${sep_left}${sep_right}${sep_left}%{B${col_back} F${col_back}}"
  end_left="%{F${col_back} B${col_sec}}${sep_right_rev}${sep_left_rev}${sep_right_rev}"

  # output
  printf "%s\n" "%{l}${end_left}${wsp}%{r}${cpu}${downspeed}${battery}${diskspace}${datetime}${network}${end_right}"
done
