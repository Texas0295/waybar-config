player_is_running=$(playerctl status > /dev/null 2>&1 && echo "yes")

if [[ $player_is_running = "yes" ]]
then
	media=$(playerctl metadata -f "{{title}}")
	player_status=$(playerctl status)
	if [[ $player_status = "Playing" ]]
	then
		song_status=''
	else
		song_status=''
	fi
else
	song_status=' 再生停止中'
fi

echo -e "$song_status $media"
