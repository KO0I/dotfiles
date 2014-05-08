#!/bin/sh
#
# behavior on a great variety of systems!
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
# Arch packages necessary for this to run:
# [xorg-apps group] - xorg-xset xorg-xsetroot xorg-xrdb xorg-xrandr
# [misc] xscreensaver numlockx xcompmgr feh xmonad
# [AUR] shantz-xwinwrap-bzr

# All machine-specific xinit instructions go here:
#. ./.xinitrc-details

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Color codes
black='\e[0;30m'
red='\e[0;31m'
green='\0;32m'
orange='\0;33m'
blue='\0;34m'
purple='\0;35m'
cyan='\0;36m'
gray='\0;37m'

darkgray='\e[1;30m'
lightred='\e[1;31m'
lightgreen='\1;32m'
yellow='\1;33m'
lightblue='\1;34m'
lightpurple='\1;35m'
lightcyan='\1;36m'
white='\1;37m'


# use all the same default apps as Xfce does
#export DE='xfce'

# for locally installed packages
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"

# needed for TwinView SDL gaming
#export SDL_VIDEO_FULLSCREEN_HEAD=1

# needed for Minecraft
#export _JAVA_AWT_WM_NONREPARENTING=1

#include fonts such as terminus
xset +fp /usr/share/fonts/local
xset fp rehash

# I like automatic numlock
#numlockx
# merge Xresources into urxvt settings
xrdb -merge ~/.Xresources
# xbinkeys for audio control
xbindkeys
# throw in some simple compositing
xcompmgr &
xscreensaver -no-splash &

# set keyboard settings
xmodmap ~/.xmodmap &

# use a screensaver for our background
#xwinwrap -b -fs -sp -fs -nf -ov -- /usr/lib/xscreensaver/klein -root -delay 34513 -view-mode walk -orientation-marks -mode wireframe -appearance solid -colors rainbow -projection-3d orthographic -projection-4d orthographic -walk-speed 1 -root -window-id WID &
# we can alternatively use a wallpaper
# feh --bg-scale ~/pictures/wallpaper.png

#  Using nitrogen:
nitrogen --restore &
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
#  volume=$(amixer | grep 'Mono: Playback [[:digit:]]'| sed s/Mono:\ Playback\ //|sed '$d')
#  case $volume in
#    *\[off\])
#    volume="[MUTED]"
#    ;;
#    *\[on\])
#    volume="$(LC_ALL=C amixer | grep 'Mono: Playback [[:digit:]]'| sed s/Mono:\ Playback\ //|sed '$d') "
#    ;;
#esac
#This section is for displaying network stuff
wln=$(LC_ALL=C ip addr show wlan0)
eth=$(LC_ALL=C ip addr show eth0)
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
      wln_ipv4=IP:\ [w:$(ip addr show wlan0 | grep 'inet ' | sed s/inet// |sed s/netmask\*.*.//| sed 's/^[ \t]*//'|sed 's/[ \t]*$//'|sed 's/\/..*//g')]
    ;;
  esac
  ;;
  *UP*)
  #  eth_ipv4=IP:\ [e:$(ifconfig eth0 | grep 'inet ' | sed s/inet// | sed s/netmask\*.*.//|sed 's/^[ \t]*//'|sed 's/[ \t]*$//')]
     eth_ipv4=IP:\ [e:$(ip addr show eth0 | grep 'inet ' | sed s/inet// |sed s/netmask\*.*.//| sed 's/^[ \t]*//'|sed 's/[ \t]*$//'|sed 's/\/..*//g')]
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

#xsetroot -name "$batt"
#xsetroot -name "$wln_ipv4$eth_ipv4 $batt $(date +%r)"
#xsetroot -name "$wln_ipv4$eth_ipv4 $batt $(date +%a\ %m.%d.%y\ %R)"
#STATUS="${wln_ipv4}${eth_ipv4} :: Battery: ${batt} :: $(date +%a\ %m.%d.%y\ ::\ %R)"
STATUS="${wln_ipv4}${eth_ipv4} :: Battery: ${batt} :: $(date +%a\ %m.%d.%y\ ::\ %l:%M\ %p)"
#xsetroot -name "$wln_ipv4$eth_ipv4 :: Battery: $batt :: $(date +%a\ %m.%d.%y\ ::\ %R)"
xsetroot -name "`echo -e ${STATUS}`"
#sleep 2 
done &
#~/dwm/dwm-update-status.sh &

#Fix wonky Java problems:
wmname LG3D &
exec dwm
