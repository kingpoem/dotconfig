#!/usr/bin/zsh
j () {
	if [[ ${1} == -* ]] && [[ ${1} != "--" ]]
	then
		autojump ${@}
		return
	fi
	setopt localoptions noautonamedirs
	local output="$(autojump ${@})" 
	if [[ -d "${output}" ]]
	then
		if [ -t 1 ]
		then
			echo -e "\\033[31m${output}\\033[0m"
		else
			echo -e "${output}"
		fi
		cd "${output}"
	else
		echo "autojump: directory '${@}' not found"
		echo "\n${output}\n"
		echo "Try \`autojump --help\` for more information."
		false
	fi
}
