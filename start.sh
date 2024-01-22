while true
	do
	gcloud cloud-shell ssh  --authorize-session --command 'curl -s "https://api.telegram.org/bot6070692016:AAEXc-WvuE6ZVrog37fw4id1uysu1IJCwRI/sendMessage"     -d "chat_id=1395896130"     -d "text=Hello, this is a test message from my bot. at $(date)"'
	sleep 10
	done
