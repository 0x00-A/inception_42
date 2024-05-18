#!/bin/sh

sed -i '/^bind/s/.*/bind 0.0.0.0/' /etc/redis/redis.conf
sed -i '/^protected-mode/s/.*/protected-mode no/' /etc/redis/redis.conf

echo "redis configuration success!"

exec "$@"
