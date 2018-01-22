#!/bin/bash
sink="$(pacmd info | grep "sink:.*$sinkName" | awk '{print $2}')"


if [[ $1 == -u ]]
then
	pactl set-sink-mute 0 false ; pactl set-sink-volume 0 +5%
else
	if [[ $1 == -d ]]
	then
		pactl set-sink-mute 0 false ; pactl set-sink-volume 0 -5%
	else
		if [[ $1 == -m ]]; then
			pactl set-sink-mute 0 toggle
		fi
	fi
fi