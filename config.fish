if status --is-login
	for p in /usr/bin /usr/local/bin /opt/local/bin /usr/local/mysql/bin /opt/local/lib/postgresql83/bin ~/bin ~/.config/fish/bin 
		if test -d $p
			set PATH $p $PATH
		end
	end
end

# Textmate defaults to /usr/bin/mate, but let's check for /usr/local/bin/mate
if test -f "/usr/local/bin/mate"
	set -x EDITOR "/usr/local/bin/mate -w"
else
	set -x EDITOR "/usr/bin/mate -w"
end

if test -d "/System/Library/Frameworks/JavaVM.framework/Home"
	set -Ux JAVA_HOME "/System/Library/Frameworks/JavaVM.framework/Home"
end

set fish_greeting ""
set -x CLICOLOR 1

function parse_svn_revision
	sh -c 'svn info 2> /dev/null' | sed -n '/^Revision/p' | sed -e 's/^Revision: \(.*\)/\1/'
end

set -x BROWSER open

# pull in a local, ignored-by-git config file
if test -f ~/.config/fish/config.local.fish
	. ~/.config/fish/config.local.fish
end	