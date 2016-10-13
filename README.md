# Wordpress-bkp-script
Wordpress Full Backup Database and files

If you can handle your webserver, you can use a cronjob to do a full backup, database and files of your Wordpress website.

@ Procedure

~:$ git clone https://github.com/garanet/Wordpress-bkp-script.git

~:$ cd Wordpress-bkp-script/

~:$ sudo su

~:$ mkdir /backup

~:$ mkdir /backup/db

~:$ mkdir /backup/www

~:$ mv wordpress_bkp.sh /backup

~:$ cd /backup

~:$ chmod a+x wordpress_bkp.sh

~:$ vi wordpress_bkp.sh <- Change the variables

~:$ sh wordpress_bkp.sh

You can put the script on your cronjob

~:$ sudo crontab -e

2016 - www.garanet.net
