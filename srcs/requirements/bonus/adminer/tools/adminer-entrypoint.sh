#!/bin/sh

sed -i '/^listen = /s/.*/listen = adminer:9000/' /etc/php/8.2/fpm/pool.d/www.conf

exec "$@"