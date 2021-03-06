TARGET=/etc/crontab
BACKUP=/etc/.crontab_backup

if [ ! -e $BACKUP ]; then
	echo "Backup does not exist"
	sudo cp $TARGET $BACKUP
	exit 0
fi

MD5=`md5sum $TARGET | awk '{ print $1 }'`
MD5_BACKUP=`md5sum $BACKUP | awk '{ print $1 }'`

if [ -z $MD5 ] | [ -z $MD5_BACKUP ]; then
	echo "MD5 is empty."
fi

if [ "$MD5" != "$MD5_BACKUP" ]; then
	echo "Crontab has been modified" | mail -s "Report" root
fi

sudo cp $TARGET $BACKUP
