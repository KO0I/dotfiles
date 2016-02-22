#!/bin/bash


#set Statusbar
while true; do
  #This section is for displaying the state of the battery
  batt=$(LC_ALL=C acpi -b)
  case $batt in
  *Discharging*)
    batt="${batt#* * * }"
    batt="${batt%%, *}-"
    ;;
  *)#charging
    batt="${batt#* * * }"
    batt="${batt%%, *}+"
  ;;
  esac
 #This section is for displaying the state of audio
  volume=$(amixer | grep 'Mono: Playback [[:digit:]]'| sed s/Mono:\ Playback\ //|sed '$d')
  case $volume in
    *\[off\])
    volume="[MUTED]"
    ;;
    *\[on\])
    volume="$(LC_ALL=C amixer | grep 'Mono: Playback [[:digit:]]'| sed s/Mono:\ Playback\ //|sed '$d') "
    ;;
esac
#This section is for displaying network stuff
wln=$(LC_ALL=C ip addr show wlan0)
eth=$(LC_ALL=C ip addr show eth0)
#
case $eth in
  *DOWN*)
    eth_ipv4=""
  case $wln in
    *DOWN*)
      wln_ipv4="[NO INTERNET]" 
    ;;
    *UP*)
    #  net-tools is deprecated, but if the new network utilities fail, the old
    #  script is here:
    #  wln_ipv4=IP:\ [w:$(ifconfig wlan0 | grep 'inet ' | sed s/inet// | sed s/netmask\*.*.//|sed 's/^[ \t]*//'|sed 's/[ \t]*$//')]
      wln_ipv4=IP:\ w:$(ip addr show wlan0 | grep -v 'inet6' |grep 'inet '|\
      sed s/inet// |sed s/netmask\*.*.//| sed 's/^[ \t]*//'|sed 's/[ \t]*$//'| sed 's/\/..*//g')
    ;;
  esac
  ;;
  *UP*)
  #  eth_ipv4=IP:\ [e:$(ifconfig eth0 | grep 'inet ' | sed s/inet// | sed s/netmask\*.*.//|sed 's/^[ \t]*//'|sed 's/[ \t]*$//')]
     eth_ipv4=IP:\ e:$(ip addr show eth0 |grep 'inet '|sed s/inet//|\
     sed s/netmask\*.*.//| sed 's/^[ \t]*//'|sed 's/[ \t]*$//'|sed 's/\/..*//g')
  case $wln in
    *DOWN*)
      wln_ipv4="[!w] " 
    ;;
    *UP*)
      wln_ipv4=""
    ;;
  esac
  ;;
esac

# Check vpn status
eip=$(geoiplookup $(curl http://ipecho.net/plain 2>/dev/null))
vpn_status=""
case $eip in
  *US*)
    vpn_status=""
  ;;
  *SE*)
    vpn_status="(VPN on) "
  ;;
esac

# Disk Status
rootdf=rt:\ $(df -h | grep '/dev/sda3' | awk '{print $5}')
win7df=w7:\ $(df -h | grep '/dev/sdb1' | awk '{print $5}')
swap1df=swp1:\ $(df -h | grep '/dev/sda2' | awk '{print $5}')
swap2df=swp2:\ $(df -h | grep '/dev/sdb2' | awk '{print $5}')



# When using dwm as the window manager, the following is suggested:
# I cannot, however, seem to get colorization to work!
#xsetroot -name "$batt"
#xsetroot -name "$wln_ipv4$eth_ipv4 $vpn_status$batt $(date +%r)"
xsetroot -name "$rootdf $win7df $swap1df $swap2df | $wln_ipv4$eth_ipv4
$vpn_status| $batt | $(date +%a\ %m.%d.%y\ %R)"
#STATUS="${wln_ipv4}${eth_ipv4} :: Battery: ${batt} :: $(date +%a\ %m.%d.%y\ ::\ %R)"
#STATUS="${wln_ipv4}${eth_ipv4} ${vpn_status}::Battery: ${batt} :: $(date +%a\ %m.%d.%y\ ::\ %l:%M\ %p)"
#xsetroot -name "$wln_ipv4$eth_ipv4 :: Battery: $batt :: $(date +%a\ %m.%d.%y\ ::\ %R)"
#xsetroot -name "`echo -e ${STATUS}`"
#sudo tpb
sleep 3
done &
