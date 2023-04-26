# Bash completion for session
function _session () {
	COMPREPLY=()
	local cur=$2
	local prev=$3

	case "$prev" in
		session)
			COMPREPLY=($(compgen -W 'help log abort extend create' -- $cur));;
		help|log|abort|create)
			COMPREPLY=();;
		extend)
			COMPREPLY=($(compgen -W '10m 20m 30m 40m 50m 60m' -- $cur));;
	esac
	return 0
}
complete -F _session session
