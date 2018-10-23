#!/usr/bin/bash

function list_monitors () {
xrandr | grep ' connected' | cut -f1 -d' '
}

function rotate () {
for monitor in $(list_monitors); do
	echo Rotating $monitor
	xrandr --output $monitor --rotate $1
done

shift

echo Rotating touchpad
xinput --set-prop "AlpsPS/2 ALPS DualPoint TouchPad" "Coordinate Transformation Matrix" $* || echo failed xinput '$*'
}

case "$1" in
	left)
		rotate left \
			0	-1	0	\
			1	0	0	\
			0	0	1
		;;
	right)
		rotate right \
			0	1	0	\
			-1	0	0	\
			0	0	1
		;;
	*)
		rotate normal \
			1	0	0	\
			0	1	0	\
			0	0	1
		;;
esac

