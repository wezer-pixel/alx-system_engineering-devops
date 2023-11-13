# puppet strace

exec { 'fix_500_e':
	command	=> "/bin/sed -i 's/.phpp/.php/g' /var/www/html/wp-settings.php",
}
