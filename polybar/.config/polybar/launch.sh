#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#MULLVAD ICON POLYBAR
#export MULLVAD_ICON_LABEL=$(polybar-mullvad)

#Date icon colors
#export BAR_MODULE_TIME="%{F${color1}}%{F-} %date% %{F${color5}}%{F-} %time%"

# Launch Polybar
#polybar -r -c ~/.config/polybar/config.ini top &
polybar -c ~/.config/polybar/config.ini top &
