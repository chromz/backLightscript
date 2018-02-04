#!/bin/bash
max="$(cat /sys/class/backlight/intel_backlight/max_brightness)"
current="$(cat /sys/class/backlight/intel_backlight/brightness)"
if [[ $1 == -d ]]
then
	if [[ current -gt 0 ]]
	then
		if [[ $((current - 20 )) -lt 0 ]]
		then
			tee /sys/class/backlight/intel_backlight/brightness <<< 0
		else
			tee /sys/class/backlight/intel_backlight/brightness <<< $((current - 20))
		fi
	fi
else
	if [[ $1 == -u ]]
	then 
		if [[ $((current + 20 )) -gt max ]]
		then
			tee /sys/class/backlight/intel_backlight/brightness <<< $max
		else
			tee /sys/class/backlight/intel_backlight/brightness <<< $((current + 20))
		fi
	fi
fi