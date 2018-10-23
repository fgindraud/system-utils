#!/usr/bin/bash

now=$(date -u +%s)
target=$((now + 30 * 60))
blank=

while sleep 1s; do
	now=$(date -u +%s)
	remaining_s=$((target - now))
	
	if ((remaining_s <= 0)); then
		echo -e "${blank}Finished"
		exit 0
	fi

	remaining_str=$(date -u -d @$remaining_s +%H:%M:%S)
	echo -en "${blank}${remaining_str}"
	blank=${remaining_str//[^!]/"\r"}
done
