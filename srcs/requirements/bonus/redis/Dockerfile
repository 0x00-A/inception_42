FROM debian:bookworm-slim

ENV PHP_VERSION 8.2

RUN apt update
RUN apt -y install redis-server php${PHP_VERSION}-redis

# COPY ./tools/redis-entrypoint.sh /usr/local/bin
# RUN chmod +x /usr/local/bin/redis-entrypoint.sh

# ENTRYPOINT [ "redis-entrypoint.sh" ]

CMD [ "redis-server", "--protected-mode no" ]
