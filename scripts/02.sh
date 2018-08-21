echo "sudo apt-get update -y >> /var/log/update_script.log" > /etc/cron.weekly/weeklyupdate.sh
echo "sudo apt-get upgrade -y >> /var/log/update_script.log" >> /etc/cron.weekly/weeklyupdate.sh
chmod +x /etc/cron.weekly/weeklyupdate.sh
echo "0 4 * * 0 root /etc/cron.weekly/weeklyupdate.sh" | crontab
