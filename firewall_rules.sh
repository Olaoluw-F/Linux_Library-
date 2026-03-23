This project involves creating aautomatic simple firewall script. 
#!/bin/bash
backup_file="/tmp/new_backup_$(date +Y%+m%+d%).txt"
sudo iptables-save > $backup_file
echo -e "---- MENU OPTION ----\nChoose what you want to do 1-4\n1: Block an IP address\n2: Allow SSH from a specifc IP\n3: Show the current iptable rules\n4: Reset to defualt (allow all)" 
read -p "pick 1-4: " choice 
case $choice in
	1)
		echo "------ START OF COMMAND ------"
		read -p "List the IP you wish to block from this system" ip
		sudo iptables -A INPUT -s $ip_block -j DENY
		echo "$ip_block has been blocked from the system"
		echo "----- END OF COMMAND -----"
		;;

	2)
		echo "----- START OF COMMAND -----"
		read -p "List the Ip with allowed access to ssh" $ip_ssh
		sudo iptables -P INPUT DROP
		sudo iptables -A INPUT -p tcp --dport 22 - $ip_ssh -j ACCEPT
		echo "---- END OF COMMAND ----"
		;;

	3)
		echo "------ List of current iptables rule -----"
		sudo iptables -L
		echo "------END OF LIST ------"
		;;

	4)
		echo " ----- RESET OF RULES ----- "
		sudo iptables -p INUPT ACCEPT
		sudo iptables -p OUTPUT ACCEPT
		sudo iptables -p FORWARD ACCEPT
		sudo iptables -F
		echo "------ RESET OVER -------"
		;;
		
esac


