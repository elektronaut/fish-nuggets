function ss -d "Start the rails server"
	if test -f "log/development.log"
		echo "Trunkating development log..."
		echo > log/development.log
	end
	if test -f "script/server"
		script/server $argv
	else
		if test -f "script/rails"
			rails server $argv
		else
			echo "server/script not found! Are you sure this is a rails project?"
		end
	end
end
