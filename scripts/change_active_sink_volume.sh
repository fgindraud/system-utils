#!/bin/bash

if [[ "$#" != 1 ]]; then
	echo "Usage: $0 <pactl_volume_spec>" >&2
	exit 1
fi

volume_spec="$1"

while IFS=$'\t' read id name module config status REPLY; do
	if [[ "$status" == "RUNNING" ]]; then
		pactl set-sink-volume "$id" "$volume_spec"
	fi
done < <(pactl list sinks short)
