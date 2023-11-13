# using puppet and strace to find out why apache returns an error

exec { 'fix_500_error':
	command => "/bin/sed -i 's/.phpp/.php/g' /var/www/html/wp-settings.php",
}
