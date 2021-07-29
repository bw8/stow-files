#!/usr/bin/env bash

dir="$HOME/.config/rofi/themes"
rofi_command="rofi -theme $dir/wifi.rasi"

# Get info
#IFACE=$(nmcli device status | sed -nE '2p' | col -x | cut -d ' ' -f 1)
IFACE=$(nmcli | head -n 1 | cut -d ':' -f 1)
#STATUS=$(nmcli device status | sed -nE '2p' | col -x | cut -d ' ' -f 17)
SSID=$(nmcli device status | sed -nE '2p' | col -x | cut -d ' ' -f 22-)
#IFACE="$(nmcli | grep -i interface | awk '/interface/ {print $2}')"
STATUS="$(nmcli radio wifi)"

active=""
urgent=""


if (ping -c 1 gnu.org ) &>/dev/null; then
	if [[ $STATUS == "enabled" ]]; then
            if [[ $IFACE == e* ]]; then
                connected=""
            else
                connected=""
            fi
            active="-a 0"
            SSID="﬉ $(nmcli device status | sed -nE '2p' | col -x | cut -d ' ' -f 22-)"
            PIP="$(wget --timeout=30 http://ipinfo.io/ip -qO -)"
	fi
else
    urgent="-u 0"
    SSID="Disconnected"
    PIP="N/A"
    connected="nope"
fi

## Icons
bmon=""
launch_cli=""
launch=""

options="$connected\n$bmon\n$launch_cli\n$launch"

## Main
chosen="$(echo -e "$options" | $rofi_command -p "$SSID  :  $PIP" -dmenu $active $urgent -selected-row 1)"
case $chosen in
    $connected)
		if [[ $STATUS == *"enable"* ]]; then
			nmcli radio wifi 
		else
			nmcli radio wifi on
		fi 
        ;;
    $bmon)
        alacritty -e echo bmon
        ;;
    $launch_cli)
        alacritty -e nmtui
        ;;
    $launch)
        alacritty -e echo nm-connection-editor
        ;;
esac

