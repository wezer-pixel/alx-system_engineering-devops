exec { 'strace_apache':
	command => 'strace -p $(pgrep apache2) -o /tmp/strace_output.txt -s 200',
	path	=> '/bin:/usr/bin',
	creates	=> '/tmp/strace_output.txt',
	require	=> Package['strace'],
}

exec { 'fix_500_e':
	command	=> "/bin/sed -i 's/.phpp/.php/g' /var/www/html/wp-settings.php",
	path	=> '/bin:/usr/bin',
	onlyif	=> 'grep -q '.phpp' /var/www/html/wp-settings.php',
	require	=> Exec['strace_apache2'],
	notifies => Service['apache2'],
}

service { 'apache2':
	ensure	=> running,
	enable	=> true,
	require	=> Exec['fix_500_e'],
}
