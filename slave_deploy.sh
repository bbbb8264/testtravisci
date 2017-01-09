#!/bin/bash

runcmd() {
	local cmd=$1
	echo "Running command on remote host: $cmd"
	sudo ssh -o StrictHostKeyChecking=no -i $private_key ubuntu@$public_ip "$cmd"
	RETVAL=$?
	if [ $RETVAL != 0 ]; then
		echo Error :Operation failed
		exit $RETVAL
	fi
}

runcmd "sudo chmod 777 -R /var/www"
sudo scp -o StrictHostKeyChecking=no -r -i $private_key ./hello.php ubuntu@$public_ip:/var/www/html
sudo scp -o StrictHostKeyChecking=no -r -i $private_key ./getcount.php ubuntu@$public_ip:/var/www/html
sudo scp -o StrictHostKeyChecking=no -r -i $private_key ./jquery-3.1.1.min.js ubuntu@$public_ip:/var/www/html
sudo scp -o StrictHostKeyChecking=no -r -i $private_key ./plusone.php ubuntu@$public_ip:/var/www/html
runcmd 'sudo echo "<?php" >> /var/www/html/mysql_config.php'
runcmd 'sudo echo "    \$servername = \"'$TaaS_main_server_1_PrivateIP'\";" >> /var/www/html/mysql_config.php'
runcmd 'sudo echo "    \$username = \"adder\";" >> /var/www/html/mysql_config.php'
runcmd 'sudo echo "    \$password = \"1234\";" >> /var/www/html/mysql_config.php'
runcmd 'sudo echo "    \$dbname = \"counter\";" >> /var/www/html/mysql_config.php'
runcmd 'sudo echo "?>" >> /var/www/html/mysql_config.php'

echo "-------------------Restart Apache----------------"

runcmd "sudo service apache2 restart"
