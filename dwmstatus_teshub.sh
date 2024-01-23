#!/bin/bash

#set Statusbar
#while $RUN_STAT; do
  #This section is for displaying the state of the battery
  # For Thinkpad X250; has two batteries
  # When a battery is exhausted, it is listed as unknown, so when it is dead,
  # do not show it's charge
  plugged1=$(LC_ALL=C acpi -b | awk 'FNR == 1 {print $3}' | sed s/.$//)
  plugged2=$(LC_ALL=C acpi -b | awk 'FNR == 2 {print $3}' | sed s/.$//)
  #b1=$(LC_ALL=C acpi -b | grep 'Battery 0'| awk '{print $4}' | sed s/..$//)
  b1=$(LC_ALL=C acpi -b | grep 'Battery 0'| awk '{print $4}' | sed s/,//)
  b2=$(LC_ALL=C acpi -b | grep 'Battery 1'| awk '{print $4}' | sed s/,//)

  raw_bright=$(cat /sys/class/backlight/intel_backlight/brightness);
  pct_bright=$(bc -l <<< $raw_bright/852*100 | sed s/..................$//)
  pct_bright=$(echo "$pct_bright%")
  #b2=$(LC_ALL=C acpi -b | grep 'Battery 1'| cut -d " " -f 4 | sed s/.$//)
  
# default display is both batteries as bat1/bat2
#batt_msg="$b1·$b2" # fancy symbol
batt_msg="$b1.$b2"  # ASCII
  
#echo $b1
#echo $b2
#echo $plugged1
#echo $plugged2

# Show if the laptop is plugged or not

# Alert user if the battery is full or empty. If bat2 is empty, but bat1 is
# still ok, then only show the status of the working battery
#if [ $plugged1 == 'Unknown' ] && [ $plugged2 == 'Unknown' ]; then
#  batt_msg="<EMPTY>"
#elif [ $plugged1 != 'Unknown' ] && [ $plugged2 == 'Unknown' ]; then
#  batt_msg="$b1"
#elif [ $plugged1 == 'Full' ] || ([ $plugged2 != 'Full' ] && [\
#  $plugged2 != 'Unknown' ]); then
#  #batt_msg="$b1·$b2"
#  batt_msg="$b1.$b2"  # ASCII
#elif [ $plugged1 == 'Full' ] || [ $plugged1 == 'Full' ]; then
#  batt_msg="<FULL>"
#else batt_msg="error"
#fi
#
#if [ $plugged1 == 'Charging' ] || [ $plugged2 == 'Charging' ] 
#then 
#  batt_msg="$batt_msg++" 
#fi
#if [ $plugged1 == 'Discharging' ] || [ $plugged2 == 'Discharging' ] 
#then
#  batt_msg="$batt_msg--"
#fi

# from ~/scripts
batt_msg=`check_battery.zsh`

ldate=$(date +%a\ %m.%d.%y)
lweek=$(date +%W)
ltime=$(date +%T)

#xsetroot -name "☼:$pct_bright ◊:$batt_msg $ldate w№$lweek $ltime"
xsetroot -name "br:$pct_bright bat:$batt_msg $ldate w:$lweek $ltime"

#sleep 5
#done &

