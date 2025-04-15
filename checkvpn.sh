v2raya_status=$(systemctl is-active --quiet v2raya&& echo running)

if [[ $v2raya_status = "running" ]]
then
	connection_stat=$(sudo v2raya --report connection | grep "not running" > /dev/null 2>&1 && echo "disactivated")
	
	if [[ $connection_stat = "disactivated" ]]
	then
    		stat=' '
	else
    		stat=' '
	fi
else
	stat=' '
fi

echo -e "$stat"
