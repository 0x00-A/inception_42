#!/bin/bash

while true; do
    if ping -c 1 "$MYSQL_HOST" &> /dev/null; then
        echo "MariaDB is reachable!"
        break
    else
        echo "Waiting for MariaDB..."
        sleep 2
    fi
done

sleep 3
echo "MariaDB is up!"

if [ -f $WP_PATH/wp-config.php ]; then

    echo "wp-config.php exists!"

else

    wp config create --dbhost=$MYSQL_HOST --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER \
    --dbpass=$MYSQL_PASSWORD --locale=en_US --path=$WP_PATH --allow-root

    wp core install --url=localhost --title=Inception --admin_user=admin --admin_password=admin \
    --admin_email=inception@42.fr --allow-root --path=$WP_PATH


fi

sed -i '/^listen = /s/.*/listen = wordpress:9000/' /etc/php/8.2/fpm/pool.d/www.conf

exec "$@"
