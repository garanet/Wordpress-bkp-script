#!/bin/sh
# www.garanet.net
# Wordpress Full Backup DB and Data
# https://github.com/garanet/Wordpress-bkp-script.git


# Define variables, change them.
#--------------------------------------------
# MysqlDB (the same of wp-config.php)
host=''
user=''
pass=''
database=''
email='@'

# Path of your www files
bkpwww='/var/www/'

# Path where you will place the backup
wwwdir='/backup/www/'
dbdir='/backup/db/'
day=$(date | awk '{ print $2"-"$3"-"$6}')

#--------------------------------------------
# Start to Play, don't touch the follow rows.
#--------------------------------------------
# DB BACKUP
cd ${dbdir}
/usr/local/bin/mysqldump --databases $database --lock-tables=false -h $host -u $user --password=$pass > "${dbdir}/$database.sql"
wait
tar -czf ${dbdir}/$database-$day.tar.gz "$database.sql"
echo $database-$day.tar.gz > /tmp/backuptmp
rm ${dbdir}/$database.sql
wait
#--------------------------------------------
# FILES BACKUP
cd ${bkpwww}
# START BACKUP
for dir in *
do
        date=`date +%Y-%m-%d`
        basefoldername=`basename ${dir}_${date}`
        tarfile="${basefoldername}.tar.gz"
        tar czf ${tarfile} ${dir}
        echo ${tarfile} >> /tmp/backuptmp
        mv ${tarfile} ${wwwdir}
done
wait
#--------------------------------------------
# FINISH AND SEND EMAIL
wait
mail -s "Wordpress Full Backup done" $email < /tmp/backuptmp
rm /tmp/backuptmp
# END

