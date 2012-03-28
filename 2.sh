#!/bin/sh
#not applicable? I do not have this directory in my home dir.
# --- commands here and before the "while true; do" are run once
#xrdb -merge ~/.Xresources
#open screensaver (so that gnome-screensaver-command -l works)
#/usr/bin/gnome-screensaver &
#open pwer manager
#exec gnome-power-manager

#black bg
#want this
#path to background
#/usr/share/backgrounds/abstract/Flow.png
xsetroot -solid black

#while loop to update statusbar with some goodies
while true; do
#battery
battotal=`awk '/last full capacity/{print $4}' < /proc/acpi/battery/BAT0/info`;
batfree=`awk '/remaining capacity/{print $3}' < /proc/acpi/battery/BAT0/state`;
battper=$(( 100*$batfree/$battotal ));
battery=`awk '/charging state/{print $3}' < /proc/acpi/battery/BAT0/state`;
#memfreak to get it in MB
#memfreak2=`grep MemFree /proc/meminfo | awk '{ print $2 }'`;
#memfreak=$(( $memfreak2/1024 ));
#time
CLK=$( date +'%a %b %d %R:%S %Z' )
#volume
VOL=$( amixer get Master | tail -1 | awk '{ print $5 }' | tr -d '[]' )
#loadavg
AVG=$( cat /proc/loadavg | cut -d ' ' -f -3 )
#network stats in Bytes
#NW=$( dstat -n --nocolor 1 1 | tail -1 | awk '{ print $1, $2}' )
#this one is not so good, increases a delay of 1-2s of the updating.
#put it in the xsetrootname plz (tip of the day, do not put | as first char after "
xsetroot -name "$AVG | $battper% $battery | Vol: $VOL | $CLK | "
sleep 1
done &

#loop is done? :p


 
 
 #traying
 sleep 1
 /usr/bin/ck-launch-session &
 /usr/local/bin/stalonetray &
 /usr/bin/nm-applet &
 /usr/bin/gnome-volume-control-applet &
 feh -z -Z --bg-scale /home/jguldmyr/Pictures/dwm_pattern.png
 #feh -z -Z -B black -b trans --bg-scale /home/jguldmyr/Pictures/Flow.png
 #start dwm after loop
 exec /usr/local/bin/dwm > /dev/null")
