# Completion for Vue.js cli

_vue() {
	typeset -a commands
	commands=(
	'init[generate a new project from a template]'
	'list[list available official templates]'
	'help[display help for cmd]'
	)

	if (( CURRENT == 2 )); then
		# explain go commands
		_values 'vue cli commands' ${commands[@]}
		return
	fi

	case ${words[2]} in
		init)
			if (( CURRENT == 3 )); then
				_values '' $(vue list | awk 'NR>2 { print $2}')
			fi
			;;
		help)
			if (( CURRENT == 3 )); then
				_values '' \
					'init' \
					'list'
			fi
			;;
	esac
}

compdef _vue vue
