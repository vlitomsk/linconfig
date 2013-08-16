#!/bin/sh

if xrandr -q | grep "VGA1 connected"; then
	xrandr --output VGA1 --primary --mode 1280x1024
	xrandr --output LVDS1 --off
fi

exec ck-launch-session dbus-launch --exit-with-session openbox-session
