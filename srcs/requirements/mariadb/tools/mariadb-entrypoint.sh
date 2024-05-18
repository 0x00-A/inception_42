#!/bin/sh

if [ -d /var/lib/mysql/$MYSQL_DATABASE ]; then
	echo "Database exist"
else

service mariadb start

sleep 1
# set root password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
# remove anonymous user
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "DELETE FROM mysql.user WHERE User='';"
# remove remote root
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
# remove test database
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "DROP DATABASE IF EXISTS test;"

# create wordpress database
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE $MYSQL_DATABASE;"

# create wordpress user
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

# grant privileges to the user
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER;"

mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

killall mariadbd

fi

sleep 1

exec "$@"
