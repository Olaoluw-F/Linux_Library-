This project starting on line 3 involves creating a Linux service management script that allows a user to 
control a web server, specifically Nginx, through an interactive menu.
#!/bin/bash
nginx_s=$(nginx -v)
webserver='nginx'
echo "--- Current Nginx Version ---"
$webserver
echo "------ MENU SCREEN ------"
echo "Menu for web service command 1: stop, 2: start, 3: restart, or 4: status"
read -p "Choose what option of the menu you want to complete: " option

case $option in
	1)
		sudo systemctl stop $webserver
		echo "--- Webserver Stopped ---"
		;;
	
	2)
		sudo systemctl start $webserver
		echo "--- Webserver Started ---"
		;;

	3)
		sudo systemctl restart $webserver
		echo "--- Webserver Restarted ---"
		;;

	4)
		sudo systemctl status $webserver
		;;
esac 

