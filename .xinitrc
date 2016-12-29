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
# For blueman
source /etc/X11/xinit/xinitrc.d/*
# throw in some simple compositing
xcompmgr &
xscreensaver -no-splash &

# set keyboard settings
xmodmap ~/.xmodmap &

# use a screensaver for our background
#xwinwrap -b -fs -sp -fs -nf -ov -- /usr/lib/xscreensaver/klein -root -delay 34513 -view-mode walk -orientation-marks -mode wireframe -appearance solid -colors rainbow -projection-3d orthographic -projection-4d orthographic -walk-speed 1 -root -window-id WID &

# Glitch background

#xwinwrap -b -fs -sp -fs -nf -ov -- /usr/lib/xscreensaver/bsod -root -delay 18 -no-windows -no-nt -no-2k -no-msdos -no-amiga -no-glados -no-android -no-apple2 -no-nvidia -no-os2 -no-mac -no-mac1 -no-macsbug -no-macx -no-os390 -no-vms -no-hvx -no-atm -no-linux -no-hppalinux -no-solaris -no-sco -no-hpu -no-tru64 WID &


# we can alternatively use a wallpaper
# feh --bg-scale ~/pictures/wallpaper.png

#  Using nitrogen:
nitrogen --restore &

# Set timer for power
#xautolock -time 30 -locker "sudo pm-suspend" -detectsleep & 

# xbinkeys for audio control
xbindkeys
#Fix wonky Java problems:
wmname LG3D &
# dwm status bar:
 source /home/patrick/.dwmstatus_x250.sh

# Run package-managed dwm
#exec dwm

# Run Local Build of dwm-6.0
exec ~/build/dwm-6.0/src/dwm-6.0/dwm > dwm.log

# Run bspwm
#sxhkd &
#urxvt &
#exec bspwm

