#!/usr/bin/env bash
#This is a script which toggles a "tablet-mode" for a 2-in-1 laptop like mine (HP Envy x360 15) which does not support iio-sensor-proxy
#I recommend making a shortcut on your dock for this.
#Prereqs: evtest and Gnome

sleep 1 &&
if [ $(gsettings get org.gnome.desktop.peripherals.touchpad send-events) == "'enabled'" ]; then
    echo "Switching off peripherals and entering tablet mode"
    gsettings set org.gnome.desktop.a11y.applications screen-keyboard-enabled true
    gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled
    evtest --grab /dev/input/event2  
else
    echo "Switching on peripherals and exiting tablet mode"
    gsettings set org.gnome.desktop.a11y.applications screen-keyboard-enabled false
    gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled
    killall evtest
fi
