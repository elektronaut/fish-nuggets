function sshtunnel -d "Set up an SSH tunnel"
	if test (count $argv) -lt 2
		echo 'usage: sshtunnel hostname remote_port [local_port (default 3000)]'
	else
		set -l hostname $argv[1]
		set -l remote_port $argv[2]
		set -l local_port 3000
		if test (count $argv) -gt 2
			set local_port $argv[3]
		end
		echo "Tunnelling $hostname:$remote_port to 0.0.0.0:$local_port"
		echo "Press ^C to stop"
		ssh -nNT -g -R "*:$remote_port:0.0.0.0:$local_port" "$hostname"
	end
end