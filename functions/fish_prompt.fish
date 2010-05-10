function fish_prompt --description "Write out the prompt"
	#printf '%s%s %s%s%s%s%s $' (set_color cyan) (whoami) (set_color yellow) (prompt_pwd) (parse_git_branch) (set_color yellow)
	printf '%s%s@%s%s' (set_color brown) (whoami) (hostname|cut -d . -f 1) (set_color normal)
	if test -w "."
		printf ' %s%s' (set_color green) (prompt_pwd)
	else
		printf ' %s%s' (set_color red) (prompt_pwd)
	end
	if is-git
		if has-git-changes
			printf '%s' (set_color red)
		else
			printf '%s' (set_color blue)
		end
		printf ' /%s' (parse_git_branch)
	end
	printf '%s> ' (set_color normal)
end