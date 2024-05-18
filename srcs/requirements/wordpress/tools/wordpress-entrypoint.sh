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

    wp config create --allow-root --dbhost=$MYSQL_HOST --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER \
    --dbpass=$MYSQL_PASSWORD --path=$WP_PATH

    wp core install --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL --path=$WP_PATH

    wp user create --allow-root $WP_USER $WP_USER_MAIL --role=$WP_USER_ROLE --user_pass=$WP_USER_PASSWORD --path=$WP_PATH

    # redis plugin and config
    wp config set WP_REDIS_HOST redis --add --allow-root --path=$WP_PATH
    wp config set WP_REDIS_PORT 6379 --add --allow-root --path=$WP_PATH
    wp config set WP_CACHE true --add --allow-root --path=$WP_PATH

    # problem Filesystem not writeable solved with this
    wp config set FS_METHOD direct --add --allow-root --path=$WP_PATH

    wp plugin install --allow-root redis-cache --activate --path=$WP_PATH

    chown www-data: $WP_PATH/wp-config.php

fi

sed -i '/^listen = /s/.*/listen = wordpress:9000/' /etc/php/8.2/fpm/pool.d/www.conf

# echo "define('WP_REDIS_HOST', 'redis');
# define('WP_REDIS_PORT', '6379');
# " >> $WP_PATH/wp-config.php

# sed -i "2 i\define('WP_REDIS_HOST', 'redis');" $WP_PATH/wp-config.php
# sed -i "3 i\define('WP_REDIS_PORT', '6379');" $WP_PATH/wp-config.php

wp redis enable --allow-root --path=$WP_PATH

exec "$@"
