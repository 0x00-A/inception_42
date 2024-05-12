#!/bin/sh

# /etc/init.d/mysql stop
# mariadbd -u root
systemctl stop mysql

su mysql

exec "$@"
