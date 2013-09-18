#!/bin/sh
#
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

# use all the same default apps as Xfce does
export DE='xfce'

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
xmodmap ~/.xmodmap

# use a screensaver for our background
# xwinwrap -b -fs -sp -fs -nf -ov -- /usr/lib/xscreensaver/klein -root -delay 34513 -view-mode walk -orientation-marks -mode wireframe -appearance solid -colors rainbow -projection-3d orthographic -projection-4d orthographic -walk-speed 1 -root -window-id WID &
# we can alternatively use a wallpaper
# feh --bg-scale ~/pictures/wallpaper.png

#Using nitrogen:
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
  *)
    batt="${batt#* * * }"
    batt="${batt%%, *}+"
    ;;
  esac

  #This section is for displaying network stuff
  wlan=$(LC_ALL=C ip  address show wlan0)
  case $wlan in
  *DOWN*)
    wlan="[!w]" 
    ;;
  *UP*)
    wlan=""
    ipv4=$(ip -4 address show wlan0 | sed -e '2!D' -e 's/inet/1\}$//'|awk '{$1=$1}1')
#    ;;
#    wlan="${wlan#* * * * * * * * * * * * * * * * * * *}"
#    wlan="${wlan%%, *}"
    ;;
  esac

#xsetroot -name "$batt"
xsetroot -name "$wlan "$ipv4" $batt $(date +%R)"
sleep 2 
done &


#Fix wonky Java problems:
wmname LG3D &
exec dwm
