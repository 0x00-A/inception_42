#!/bin/bash

MYSQL_DATABASE='wp_dp'
MYSQL_USER='abdelatif'
MYSQL_PASSWORD='secure123'
MYSQL_HOST='mariadb'

# until mysqladmin ping -h "$MYSQL_HOST" --user=$MYSQL_USER --password="$MYSQL_PASSWORD" --silent
# do
#     echo "Waiting for MySQL..."
#     sleep 2
# done
# Ping the container until it responds (exit code 0)
while true; do
    if ping -c 1 "$MYSQL_HOST" &> /dev/null; then
        echo "Container is reachable!"
        break
    else
        echo "Waiting for container..."
        sleep 2
    fi
done

echo "MySQL is up!"
# if [ -f wp-config.php ]

wp config create --dbhost=$MYSQL_HOST --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER \
--dbpass=$MYSQL_PASSWORD --locale=en_US --path=/srv/www/wordpress --allow-root

wp core install --url=localhost --title=Inception --admin_user=admin --admin_password=admin \
 --admin_email=inception@42.fr --allow-root --path=/srv/www/wordpress

sed -i '/^listen = /s/.*/listen = 0.0.0.0:9000/' /etc/php/8.2/fpm/pool.d/www.conf

exec "$@"
