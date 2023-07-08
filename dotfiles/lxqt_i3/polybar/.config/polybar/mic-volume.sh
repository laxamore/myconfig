#!/bin/sh

#DEFAULT_SOURCE_INDEX=$(pacmd list-sources | grep "\* index:" | cut -d' ' -f5)

display_volume() {
	if [ -z "$volume" ]; then
	  echo "No Mic Found"
	else
	  if [[ "$mute" == *"true"* ]]; then
	    echo "%{F#707880}󰍭%{F-}"
	  elif [[ "$mute" == *"false"* ]]; then
	    echo "%{F#F0C674}󰍬%{F-} $volume%"
	  fi
	fi
}

case $1 in
	"show-vol")
		volume=$(pamixer --default-source --get-volume)
		mute=$(pamixer --default-source --get-mute)
		display_volume
		;;
	"inc-vol")
		pamixer --default-source --allow-boost -i 1
		;;
	"dec-vol")
		pamixer --default-source --allow-boost -d 1
		;;
	"mute-vol")
		pamixer --default-source -t
		;;
	*)
		echo "Invalid script option"
		;;
esac
