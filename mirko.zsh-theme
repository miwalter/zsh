_lp_cpu_load () {
	local bol load eol
	read bol load eol <<<"$( LANG=C sysctl -n vm.loadavg )"
	echo "$load"
}
_last_pid() {
	echo "$!"
}

function my_update() {
	echo "$(uptime | awk '{print $11}' | tr ',' ',')"
}
function precmd {
	cpu_load="$(_lp_cpu_load)"
	last_pid="$(_last_pid)"
	RPROMPT='%{$reset_color%}${ret_statusr}${cpu_load}%{$reset_color%}'
}

#local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}[%?]➜ )"
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
local ret_statusr="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%}[%?])"

PROMPT='[mac]${ret_status}%{$fg[blue]%}%/%{$reset_color%} '
#PROMPT='[mac]${ret_status}%{$fg[blue]%}%/%{$reset_color%} $(git_prompt_info)'
#RPROMPT='%{$reset_color%}${ret_statusr}%{$reset_color%}'
#RPROMPT='%{$reset_color%}${ret_statusr}%{$reset_color%}${cpu_load}'

#setopt promptsubst

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
