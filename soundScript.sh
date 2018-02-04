#!/bin/bash
sink="$(pacmd list-sinks|awk '/\* index:/{ print $3 }')"


if [[ $1 == -u ]]
then
	pactl set-sink-mute $sink false ; pactl set-sink-volume $sink +5%
else
	if [[ $1 == -d ]]
	then
		pactl set-sink-mute $sink false ; pactl set-sink-volume $sink -5%
	else
		if [[ $1 == -m ]]; then
			pactl set-sink-mute $sink toggle
		fi
	fi
fi