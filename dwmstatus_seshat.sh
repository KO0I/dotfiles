#!/bin/bash

#set Statusbar
#while $RUN_STAT; do
  #This section is for displaying the state of the battery
  # For Thinkpad X250; has two batteries
  # When a battery is exhausted, it is listed as unknown, so when it is dead,
  # do not show it's charge
# default display is both batteries as bat1/bat2
  
#echo $plugged1
#echo $plugged2

# Show if the laptop is plugged or not

# Alert user if the battery is full or empty. If bat2 is empty, but bat1 is
# still ok, then only show the status of the working battery

ldate=$(date +%a\ %m.%d.%y)
lweek=$(date +%W)
ltime=$(date +%T)

#xsetroot -name "☼:$pct_bright ◊:$batt_msg $ldate w№$lweek $ltime"
xsetroot -name "$ldate w:$lweek $ltime"

#sleep 5
#done &

