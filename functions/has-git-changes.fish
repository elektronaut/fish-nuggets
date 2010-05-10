function has-git-changes
	not git diff-index --quiet --cached HEAD --
	or not git diff-files --quiet
end