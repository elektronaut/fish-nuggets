function is-git
	if not which -s git
		return
	end
	git rev-parse --git-dir ^/dev/null >/dev/null
end
