function sc -d "Run the Rails console"
	if test -f "script/console"
		script/server $argv
	else
		if test -f "script/rails"
			rails console $argv
		else
			echo "server/console not found! Are you sure this is a rails project?"
		end
	end
end

