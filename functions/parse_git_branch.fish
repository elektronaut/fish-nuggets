function parse_git_branch
	# make sure git is installed
	if not which -s git
		return
	end

	# make sure the directory is a git repo
	if not is-git
		return
	end

	set -l branch (git symbolic-ref -q HEAD)
	if test ! -z "$branch"
		echo -n $branch | sed -e 's/refs\/heads\///'
	else
		git name-rev --name-only HEAD ^/dev/null
	end
end