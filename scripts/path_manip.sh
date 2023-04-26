
# Add to start of path, remove il already present
function path_prepend {
	local varname=$1
	local prepend=$2
	local -a path_array
	local IFS=':'

	# Split in an array
	read -a path_array <<< "${!varname}"
	# Remove
	local index
	for index in ${!path_array[*]}; do
		if [[ "${path_array[$index]}" == "$prepend" ]]; then
			unset path_array[$index]
		fi
	done
	path_array=("$prepend" "${path_array[@]}")
	# Export
	export $varname="${path_array[*]}"
	echo $varname
}
