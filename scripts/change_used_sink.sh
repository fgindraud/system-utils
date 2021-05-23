#!/bin/bash

# Current "used" sink is defined as the default one.
_default_sink_tag="Default Sink: "
current_sink="$(pactl info | grep "$_default_sink_tag")"
current_sink="${current_sink#$_default_sink_tag}"

# Gather sinks info : name <-> pos association, and where is the current one
declare -a sink_names
unset current_sink_pos

while IFS=$'\t' read id name module config status REPLY; do
	if [[ "$name" == "$current_sink" ]]; then
		current_sink_pos=${#sink_names[@]}
		current_sink_id="$id"
	fi
	sink_names[${#sink_names[@]}]="$name"
done < <(pactl list short sinks)

if ! test -v current_sink_pos; then
	echo "Current default sink not in sink list, aborting..." >&2
	exit 1
fi

# Next sink is in cycle order, use modulo
next_sink_pos=$(( (current_sink_pos + 1) % ${#sink_names[@]} ))
next_sink_name="${sink_names[$next_sink_pos]}"

# Change default sink and move all audio clients to new sink
# Using pacmd for batched commands
(
echo set-default-sink "$next_sink_name"
while IFS=$'\t' read id sink_id client driver config REPLY; do
	if [[ "$sink_id" != "$current_sink_id" ]]; then
		echo move-sink-input $id "$next_sink_name"
	fi
done < <(pactl list short sink-inputs)
) | pacmd

