#!/bin/bash
sink="$(pacmd list-sinks|awk '/\* index:/{ print $3 }')"
current="$(pacmd list-sinks |grep -wA 15 'index: '${sink}'' |grep 'volume:' |egrep -v 'base volume:' |awk -F : '{print $3}' |grep -o -P '.{0,3}%'|sed s/.$// |tr -d ' ')"
echo $current
if [[ $1 == -u ]]
then
  if [[ $((current + 5 )) -gt 100 ]]
  then
    pactl set-sink-mute $sink false ; pactl set-sink-volume $sink 100%
  else
    pactl set-sink-mute $sink false ; pactl set-sink-volume $sink +5%
  fi
else
	if [[ $1 == -d ]]
	then
		if [[ $((current + 5 )) -lt 0 ]]
    then
      pactl set-sink-mute $sink false ; pactl set-sink-volume $sink 0%
    else
      pactl set-sink-mute $sink false ; pactl set-sink-volume $sink -5%
    fi
	else
		if [[ $1 == -m ]]; then
			pactl set-sink-mute $sink toggle
		fi
	fi
fi
